import SwiftUI

struct ContentView: View {
    @State private var age: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var result: String = ""
    @State private var isNormalBMI: Bool = false
    @State var isDone = false
    
 
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false)
            {
                VStack {
                    
                    Image("nammi 1")
                        .offset(CGSize(width: 10.0, height: -40))
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 20) // تحديد حجم المربع
                            .foregroundColor(Color.white) // تحديد لون المربع
                            .cornerRadius(10) // تحديد نصف قطر الزوايا لتكون مرئية
                        
                        Text("Type your child's age1")
                            .foregroundColor(Color.font) // تحديد لون النص
                    }
                    .offset(CGSize(width: -100, height: -50))
                    
                    
                    TextField("Age1", text: $age)
                    
                        .padding()
                        .keyboardType(.numberPad)
                        .cornerRadius(10)
                        .offset(CGSize(width: -10, height: -50))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 1)
                                .stroke(Color(red: 0.51, green: 0.64, blue: 0.08), lineWidth: 2)
                                .offset(CGSize(width: -10, height: -50))
                            
                        )
                    
                    
                        .keyboardType(.numberPad)
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 20) // تحديد حجم المربع
                            .foregroundColor(Color.white) // تحديد لون المربع
                            .cornerRadius(10) // تحديد نصف قطر الزوايا لتكون مرئية
                        
                        Text("Type your child's weight1")
                            .foregroundColor(Color.font) // تحديد لون النص
                    }
                    .offset(CGSize(width: -100, height: -40))
                    TextField("Weight1", text: $weight)
                        .padding()
                        .keyboardType(.numberPad)
                        .cornerRadius(10)
                        .offset(CGSize(width: -10, height: -40))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .offset(CGSize(width: 10, height: -40))
                                .inset(by: 1)
                                .stroke(Color(red: 0.51, green: 0.64, blue: 0.08), lineWidth: 2)
                            
                        )
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 20) // تحديد حجم المربع
                            .foregroundColor(Color.white) // تحديد لون المربع
                            .cornerRadius(10) // تحديد نصف قطر الزوايا لتكون مرئية
                        
                        Text("Type your child's height1")
                            .foregroundColor(Color.font) // تحديد لون النص
                    }
                    .offset(CGSize(width: -100, height: -25))
                    TextField("Height1", text: $height)
                        .padding()
                        .keyboardType(.numberPad)
                        .cornerRadius(10)
                        .offset(CGSize(width: -10, height: -30))
                        .onChange(of: height){
                            var isNormal = calculateHealth()
                            isNormalBMI = isNormal
                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .offset(CGSize(width: 10, height: -30))
                                .inset(by: 1)
                                .stroke(Color(red: 0.51, green: 0.64, blue: 0.08), lineWidth: 2)
                            
                        )
                    Image(systemName: "camera.viewfinder")
                    
                        .foregroundColor(.gray)
                        .font(.system(size: 30))
                        .offset(CGSize(width: 130, height: -80))
                    
                    
                    if result == "Normal" {
//                        Button(
//                            action: {
                            //    //                        let isNormal = calculateHealth()
                            //    //                        isNormalBMI = isNormal
                            //
                            //                        })
                            NavigationLink (destination:  Safe()) {
                                Text("Show results1")
                                    .frame(width: 200, height: 20)
                                    .font(.system(size: 25))
                                    .padding()
                                    .background(Color.e3)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 3)
                                    .offset(CGSize(width: -5, height: -50))
                            }
                        }
                    else if result == "Abnormal" {
//                        Button(action: {
//    //                        let isNormal = calculateHealth()
//    //                        isNormalBMI = isNormal
//                            
//                        }) 
                        NavigationLink (destination: notsafe()){
                            Text("Show results1" )
                                .frame(width: 200, height: 20)
                                .font(.system(size: 25))
                                .padding()
                                .background(Color.e3)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .shadow(radius: 3)
                                .offset(CGSize(width: -5, height: -50))
                        }
                    }
                    else{
//                        Text("الرجاء إدخال قيم صحيحة.")
//                        NavigationLink (destination: notsafe()){
                            Text("Show results1" )
                                .frame(width: 200, height: 20)
                                .font(.system(size: 25))
                                .padding()
                                .background(Color.e3)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .shadow(radius: 3)
                                .offset(CGSize(width: -5, height: -50))
//                        }
                    }
                    
//                    if result == "طبيعي" {
//                        
//                        Safe()
//                    } else if result == "غير طبيعي" {
//                        notsafe()
//                    }
                    
                    //            else {
                    //                          Text(result)
                    //                              .foregroundColor(result.contains("Not valid") ? .red : .black)
                    //                              .padding()
                    //                      }
                }
                .padding()
                .onTapGesture {
                    hideKeyboard()
                }    //  .environment(\.layoutDirection,.rightToLeft)
                    .padding()
            }}
        
    }
        

    private func calculateHealth() -> Bool {
        guard let ageValue = Double(age),
              let heightValue = Double(height),
              let weightValue = Double(weight)
        else {
            result = " Please enter valid values."
            return false
        }

        let bmi = weightValue / ((heightValue / 100) * (heightValue / 100))

        result = (bmi < 18.5 || bmi > 24.9) ? "Abnormal" : "Normal"
        
        return bmi < 18.5 || bmi > 24.9
    }


 
}

struct HealthCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
