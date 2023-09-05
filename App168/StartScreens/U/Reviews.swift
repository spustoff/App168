//
//  Reviews.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    @AppStorage("status") var status: Bool = false
    
    let isContacts: Bool
    
    var body: some View {

        ZStack {
            
            Color("s")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text("Leave your opinion")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                Text("Rate us in the App Store, it will help us make it even better")
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
                
                if isContacts {
                    
                    NavigationLink(destination: {
                        
                        Contacts()
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
                    
                } else {
                    
                    Button(action: {
                        
                        status = true
                        
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
        }
        .ignoresSafeArea(.all, edges: .top)
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}


struct Reviews_Previews: PreviewProvider {
    static var previews: some View {
        Reviews(isContacts: false)
    }
}
