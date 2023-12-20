import SwiftUI

struct ContentView: View {
    @State private var age: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var result: String = ""

    var body: some View {
            VStack {
                
                Image("r5")
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 20) // تحديد حجم المربع
                        .foregroundColor(Color.white) // تحديد لون المربع
                        .cornerRadius(10) // تحديد نصف قطر الزوايا لتكون مرئية
                    
                    Text("اكتب عمر طفلك")
                        .foregroundColor(Color.font) // تحديد لون النص
                }
                .offset(CGSize(width: -100, height: 10.0))
                
                
                TextField("العمر", text: $age)
                    .padding()
                    .keyboardType(.numberPad)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(Color(red: 0.51, green: 0.64, blue: 0.08), lineWidth: 2)
                        
                    )
                
                
                    .keyboardType(.numberPad)
                
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 20) // تحديد حجم المربع
                        .foregroundColor(Color.white) // تحديد لون المربع
                        .cornerRadius(10) // تحديد نصف قطر الزوايا لتكون مرئية
                    
                    Text("اكتب وزن طفلك")
                        .foregroundColor(Color.font) // تحديد لون النص
                }
                .offset(CGSize(width: -100, height: 10.0))
                TextField("الوزن (كجم)", text: $weight)
                    .padding()
                    .keyboardType(.numberPad)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(Color(red: 0.51, green: 0.64, blue: 0.08), lineWidth: 2)
                        
                    )
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 20) // تحديد حجم المربع
                        .foregroundColor(Color.white) // تحديد لون المربع
                        .cornerRadius(10) // تحديد نصف قطر الزوايا لتكون مرئية
                    
                    Text("اكتب طول طفلك")
                        .foregroundColor(Color.font) // تحديد لون النص
                }
                .offset(CGSize(width: -100, height: 10.0))
                TextField("الطول (سم)", text: $height)
                    .padding()
                    .keyboardType(.numberPad)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(Color(red: 0.51, green: 0.64, blue: 0.08), lineWidth: 2)
                        
                    )
                Image(systemName: "camera.viewfinder")
                
                      .foregroundColor(.gray)
                      .font(.system(size: 30))
                      .offset(CGSize(width: 150, height: -50))
                
                
                
                
                Button("اظهر النتائج") {
                    calculateHealth()
                    
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 10)
                .padding()
                .foregroundColor(.white)
                .background(Color.e3)
                .cornerRadius(8)
                
                .offset(CGSize(width: -1, height: 20))
                
                Text(result)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
                }.onTapGesture {
                    hideKeyboard()
                    
                }
                .environment(\.layoutDirection,.rightToLeft)
                .padding()
        
    }

    private func calculateHealth() {
        guard let ageValue = Double(age),
              let heightValue = Double(height),
              let weightValue = Double(weight) else {
            result = "الرجاء إدخال قيم صحيحة."
            
            
            return
        }

        let bmi = weightValue / ((heightValue / 100) * (heightValue / 100))

        result = String(format: "مؤشر كتلة الجسم (BMI): %.2f\n%@", bmi, (bmi < 18.5 || bmi > 24.9) ? "الحالة: غير طبيعية" : "الحالة: طبيعية")
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
