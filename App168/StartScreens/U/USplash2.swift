//
//  USplash2.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI

struct USplash2: View {
    var body: some View {
        
        ZStack {
            
            Color("s")
                .ignoresSafeArea()
            
            VStack {
                
                Image("USplash2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text("AI signals")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                Text("Our algorithm will help you make the right choice")
                    .foregroundColor(.gray)
                    .font(.system(size: 18, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(9)
                    .padding(.bottom, 40)
                
                HStack {
      
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                }
                
                NavigationLink(destination: {
                    
                    Reviews()
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

struct USplash2_Previews: PreviewProvider {
    static var previews: some View {
        USplash2()
    }
}
