import SwiftUI

struct onboarding2: View {
  
  @State private var isactive: Bool = false  // Change here
  
    
    
  var body: some View {
      NavigationView {
          
          ZStack {
              
              VStack {
                  
//                  Button("تخطي") {
//                      isactive = true
//                  }
//                  .font(.system(size: 25))
//                  .font(.title)
//                  .offset(CGSize(width: 150, height: 30))
//                  .foregroundColor(.we8)
                  
            //    NavigationLink(destination: ContentView(), isActive: $isactive) {  // Change here
                    //EmptyView()
                // }
                  NavigationLink {
                      // destination view to navigation to
                      ContentView()
                          .navigationBarHidden(true)
                  } label: {
                      Text("Skip1")
                          .foregroundColor(.font)
                  }.font(.system(size: 25))
                      .font(.title)
                      .offset(CGSize(width: 150, height: 30))
                      .foregroundColor(.we8)
                      
                  
                  TabView {
                      VStack {
                          ZStack {
                              RoundedRectangle(cornerRadius: 10)
                                  .frame(width: 340, height: 400)
                                  .foregroundColor(.s1)
                                  .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                  .offset(CGSize(width: -1, height: -10))
                              Image("na1")
                                  .padding(.vertical, -150)
                                  .padding(.horizontal, -150)
                              
                              Text("Disc1")
                                  .foregroundColor(.s2)
                                  .font(.system(size: 20))
                                  .font(.title)
                                  .offset(CGSize(width: 1, height: 30))
                          }
                      }
                      .padding()
                      
                      VStack {
                          ZStack {
                              RoundedRectangle(cornerRadius: 10)
                                  .frame(width: 340, height: 400)
                                  .foregroundColor(.s1)
                                  .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                  .offset(CGSize(width: -1, height: -11))
                              Image("t6")
                                  .offset(CGSize(width: 1, height: -130))
                              
                              Text("Disc2")
                                  .foregroundColor(.s2)
                                  .font(.system(size: 20))
                                  .font(.body)
                                  .offset(CGSize(width: 1, height: 30))
                          }
                      }
                      .padding()
                      
                      VStack {
                         
                              NavigationLink(
                                  destination:  ContentView()
                                    .navigationBarHidden(true)
                              ){
                                  ZStack{
                                  RoundedRectangle(cornerRadius: 10)
                                      .frame(width: 340, height: 400)
                                      .foregroundColor(.s1)
                                      .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                      .offset(CGSize(width: -1, height: -10))
                                  
                                  Text("Start1")
                                      .foregroundColor(.s2)
                                      .font(.system(size: 100))
                                      .font(.body)
                                      .offset(CGSize(width: 1, height: 5))
                              }
                          }}}
                //  .environment(\.layoutDirection, .rightToLeft)
              }
              .tabViewStyle(PageTabViewStyle())
              .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
          }
      }
          }
}

struct Onboarding1_Previews: PreviewProvider {
  static var previews: some View {
      onboarding2()
  }
}






