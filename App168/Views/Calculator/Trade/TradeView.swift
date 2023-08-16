//
//  TradeView.swift
//  App168
//
//  Created by IGOR on 08/08/2023.
//

import SwiftUI

struct TradeView: View {
    
    @Environment(\.presentationMode) var router
    
    let index: String

    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(index)
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
                
                VStack {
                    
                    TradeChart(pair: index)
                        .disabled(true)
                }
                .background(Color("s"))

                NavigationLink(destination: {
                    
                    CalculatorDetail(index: index)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                        .padding()
                        .padding(.bottom)
                })
            }
        }
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView(index: "BTC")
    }
}
