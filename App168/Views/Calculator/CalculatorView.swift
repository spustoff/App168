//
//  CalculatorView.swift
//  App168
//
//  Created by IGOR on 08/08/2023.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Yield Calculator")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.coins, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.current_coin = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                        
                                        Spacer()
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .stroke(Color.gray.opacity(0.3))
                                                .frame(width: 20, height: 20)
                                            
                                            Circle()
                                                .fill(Color.blue)
                                                .frame(width: 15, height: 15)
                                                .opacity(viewModel.current_coin == index ? 1 : 0)
                                        }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                })
                            }
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: {
                        
                        TradeView(index: viewModel.current_coin)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("p")))
                    })
                    .padding()
                    .padding(.bottom)
                }
                .background(Color("s").ignoresSafeArea(.all, edges: .bottom))
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
