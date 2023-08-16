//
//  ResultsView.swift
//  App168
//
//  Created by IGOR on 13/08/2023.
//

import SwiftUI

struct ResultsView: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Result")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                VStack(spacing: 45, content: {
                    
                    VStack(spacing: 10, content: {
                        
                        Text("The performance of your investment in $ today is")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Text("$\(Int.random(in: 1...25000))")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .black))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                    
                    VStack(spacing: 10, content: {
                        
                        Text("Increase (Dollars)")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Text("$\(Int.random(in: 1...25000))")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .black))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                    
                    VStack(spacing: 10, content: {
                        
                        Text("Increase")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Text("$\(Int.random(in: 1...25000))")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .black))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
