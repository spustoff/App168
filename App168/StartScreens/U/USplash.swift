//
//  USplash.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI

struct USplash: View {
    
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("s")
                .ignoresSafeArea()
            
            VStack {
                
                Image("USplash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text("A new trade view")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                Text("Discover new opportunities with new AI technologies")
                    .foregroundColor(.gray)
                    .font(.system(size: 18, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(9)
                    .padding(.bottom, 40)
                
                HStack {
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                }
                
                NavigationLink(destination: {
                    
                    USplash2(isContacts: isContacts)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 9).fill(Color("p")))
                })
                .padding()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}
struct USplash_Previews: PreviewProvider {
    static var previews: some View {
        USplash(isContacts: false)
    }
}
