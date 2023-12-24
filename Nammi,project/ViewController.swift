import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    var measuringNodes: [SCNNode] = []
    var measuringLine: SCNNode?
    var measurementLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if measuringNodes.count >= 2 {
            measuringNodes.forEach { $0.removeFromParentNode() }
            measuringNodes.removeAll()
            measuringLine?.removeFromParentNode()
            measuringLine = nil
            measurementLabel?.removeFromSuperview()
            measurementLabel = nil
        }
        
        guard let sceneView = gestureRecognizer.view as? ARSCNView else { return }
        
        let touchLocation = gestureRecognizer.location(in: sceneView)
        
        let hitTestResults = sceneView.hitTest(touchLocation, types: .featurePoint)
        
        if let result = hitTestResults.first {
            let position = result.worldTransform.columns.3
            
            let measuringNode = createMeasuringNode(position: position)
            sceneView.scene.rootNode.addChildNode(measuringNode)
            measuringNodes.append(measuringNode)
            
            if measuringNodes.count == 2 {
                let start = measuringNodes[0].position
                let end = measuringNodes[1].position
                
                let measuringLine = createMeasuringLine(start: start, end: end)
                sceneView.scene.rootNode.addChildNode(measuringLine)
                self.measuringLine = measuringLine
                
                let distance = measureDistance(start: start, end: end)
                showMeasurementLabel(distance: distance, position: end)
            }
        }
    }
    
    func createMeasuringNode(position: simd_float4) -> SCNNode {
        let sphere = SCNSphere(radius: 0.01)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        sphere.materials = [material]
        
        let node = SCNNode(geometry: sphere)
        node.position = SCNVector3(position.x, position.y, position.z)
        return node
    }
    
    func createMeasuringLine(start: SCNVector3, end: SCNVector3) -> SCNNode {
        let distance = start.distance(to: end)
        
        let lineGeometry = SCNBox(width: 0.01, height: 0.01, length: CGFloat(distance), chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green
        lineGeometry.materials = [material]
        
        let lineNode = SCNNode(geometry: lineGeometry)
        
        lineNode.position = SCNVector3(
            (start.x + end.x) / 2,
            (start.y + end.y) / 2,
            (start.z + end.z) / 2
        )
        
        lineNode.look(
            at: end,
            up: sceneView.scene.rootNode.worldUp,
            localFront: lineNode.worldFront
        )
        
        return lineNode
    }
    
    func measureDistance(start: SCNVector3, end: SCNVector3) -> Float {
        let distance = start.distance(to: end)
        return distance
    }
    
    func showMeasurementLabel(distance: Float, position: SCNVector3) {
        let distanceInCm = distance * 100 // Convert distance from meters to centimeters
        
        let label = UILabel()
        label.text = "\(distanceInCm) cm" // Display distance in centimeters
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 0, width: sceneView.bounds.width, height: 50)
        label.center = CGPoint(x: sceneView.bounds.midX, y: sceneView.bounds.minY + 100)
        view.addSubview(label)
        measurementLabel = label
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
}

extension SCNVector3 {
    func distance(to vector: SCNVector3) -> Float {
        let dx = self.x - vector.x
        let dy = self.y - vector.y
        let dz = self.z - vector.z
        return sqrt(dx*dx + dy*dy + dz*dz)
    }
}
