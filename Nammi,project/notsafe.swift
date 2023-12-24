//
//  notsafe.swift
//  Nammi,project
//
//  Created by Shahad Fuad Alabdrabalnabi on 07/06/1445 AH.
//

import SwiftUI

struct notsafe: View {
    @State private var value: Int = 20
    @State private var currentPage: Int = 2
    

    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Your child's results are1")
                    .font(.title)
                    .foregroundColor(.font)
                    .offset(CGSize(width: 0, height: -40))

                
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 100))
                    .offset(CGSize(width: 0, height: 10))

                
                Text("NotSafe1")
                    .font(.title)
                    .foregroundColor(.red)
                    .offset(CGSize(width: 0, height: 20))

                
                HStack {
                    Spacer()
                    Image(systemName: "arrowshape.down.fill")
                        .foregroundColor(.black)
                        .bold()
                        .padding(.leading, 10)
                        .padding(.trailing, 320)
                        .offset(CGSize(width: 0, height: 80))

                    
                }
                
                Rectangle()
                    .foregroundColor(.white)
                    .overlay(
                        LinearGradient(colors: [.red, .green], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 300, height: 20)
                    .offset(CGSize(width: 0, height: 90))

            }
            .offset(CGSize(width: 0, height: -100))

                
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 150)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .offset(CGSize(width: -1, height: -20))
                        .padding(.vertical, 250)
                        .padding(.horizontal,-100)
                    
                    Text("MOH1")
                        .foregroundColor(.b1)
                        .font(.system(size: 15))
                        .font(.caption)
                        .offset(CGSize(width: 0, height: 9))

                    
                    Text("MOH2")
                        .foregroundColor(.font)
                        .bold()
                        .font(.system(size: 15))
                        .font(.headline)
                        .offset(CGSize(width: 0, height: -40))

                    Image("lo")
                        .resizable()
                          .foregroundColor(.gray)
                          .font(.system(size: 10))
                          .offset(CGSize(width: 140, height: -40))
                          .frame(width: 50, height: 50)

                    
                    
                }
                .offset(CGSize(width: 0, height: 300))

            }
        }
    }

    
    struct notsafe_Previews: PreviewProvider {
        static var previews: some View {
            notsafe()
        }
    }
