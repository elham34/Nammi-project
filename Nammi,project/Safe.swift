//
//  Safe.swift
//  Nammi,project
//
//  Created by Shahad Fuad Alabdrabalnabi on 07/06/1445 AH.
//

import SwiftUI

struct Safe: View {
    @State private var value: Int = 20
    @State private var results: String = "سليم"
    @State private var currentPage: Int = 2
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("نتائج طفلك هي")
                    .font(.title)
                    .foregroundColor(.font)
                    .padding()
                
                if value >= 18 && value <= 24 {
                    Group {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 100))
                            .padding()
                        
                        Text(results)
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                        
                        HStack {
                            Spacer()
                            Image(systemName: "arrowshape.down.fill")
                                .foregroundColor(.black)
                                .bold()
                                .padding(.leading, 10)
                                .padding(.trailing, 60)
                        }
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .overlay(
                                LinearGradient(colors: [.red, .green], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: 300, height: 20)
                            .padding()
                    }
                }
            }
        }
    }
}
struct Safe_Previews: PreviewProvider {
    static var previews: some View {
        Safe()
    }
}
