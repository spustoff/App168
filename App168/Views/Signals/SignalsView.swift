//
//  SignalsView.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI

struct SignalsView: View {
    
    @StateObject var viewModel = SignalsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Quantum AI signals")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            
                            Image("eye")
                        })
                    }
                    .padding(.horizontal)
                }
                                
                VStack {
                    
                    HStack {
                        
                        ForEach(viewModel.colums, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.current_colum = index
                                
                            }, label: {
                                
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 8).fill(viewModel.current_colum == index ? Color.white.opacity(0.3) : Color.white.opacity(0)))
                                
                            })
                        }
                    }
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.3)))
                    .padding(9)
                    
                    VStack(alignment: .leading) {
                        
                        Text("00:00:\(viewModel.time)")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Time to update signals")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular))
                    }
                    .padding(8)
                    .background(Image("sbg").cornerRadius(18))
                    .padding()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            HStack {
                                
                                Image("Bitcoin")
                                
                                Text("Bitcoin")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                                Spacer()
                                
                                Image("buy")
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Price")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.2f", Double.random(in: 24000...25500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Date")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("08.08.23")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Potential profit")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.f", Double.random(in: 800...1500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                            
                            HStack {
                                
                                Button(action: {}, label: {
                                    
                                    Image("eyeg")
                                })
                                
                                Spacer()
                                
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bg2"))
                        .padding(.horizontal)

                        VStack {
                            
                            HStack {
                                
                                Image("Etherium")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 34)
                                
                                Text("Etherium")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                                Spacer()
                                
                                Image("sell")
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Price")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.2f", Double.random(in: 19000...23500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Date")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$25684.41")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Potential profit")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.f", Double.random(in: 700...1300)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                            
                            HStack {
                                
                                Button(action: {}, label: {
                                    
                                    Image("eyeg")
                                })
                                
                                Spacer()
                                
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bg2"))
                        .padding(.horizontal)
                        
                        VStack {
                            
                            HStack {
                                
                                Image("Bounty")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 34)
                                
                                Text("Bounty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                                Spacer()
                                
                                Image("buy")
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Price")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.2f", Double.random(in: 3000...5500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Date")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("03.08.23")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Potential profit")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.f", Double.random(in: 400...600)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                            
                            HStack {
                                
                                Button(action: {}, label: {
                                    
                                    Image("eyeg")
                                })
                                
                                Spacer()
                                
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bg2"))
                        .padding(.horizontal)

                        VStack {
                            
                            HStack {
                                
                                Image("Burst")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 34)
                                
                                Text("Burst")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                                Spacer()
                                
                                Image("sell")
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Price")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.2f", Double.random(in: 3000...4500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Date")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("01.08.23")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Potential profit")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.f", Double.random(in: 300...500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                            
                            HStack {
                                
                                Button(action: {}, label: {
                                    
                                    Image("eyeg")
                                })
                                
                                Spacer()
                                
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bg2"))
                        .padding(.horizontal)
                        
                        VStack {
                            
                            HStack {
                                
                                Image("Generic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 34)
                                
                                Text("Generic")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                                Spacer()
                                
                                Image("buy")
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Price")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.2f", Double.random(in: 1000...2500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Date")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("24.07.23")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Potential profit")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.f", Double.random(in: 100...300)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                            
                            HStack {
                                
                                Button(action: {}, label: {
                                    
                                    Image("eyeg")
                                })
                                
                                Spacer()
                                
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bg2"))
                        .padding(.horizontal)
                        
                        VStack {
                            
                            HStack {
                                
                                Image("Steem")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 34)
                                
                                Text("Steem")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                                Spacer()
                                
                                Image("sell")
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Price")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.2f", Double.random(in: 1400...2500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Purchase Date")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("27.07.23")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Potential profit")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(String(format: "%.f", Double.random(in: 300...500)))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                            
                            HStack {
                                
                                Button(action: {}, label: {
                                    
                                    Image("eyeg")
                                })
                                
                                Spacer()
                                
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bg2"))
                        .padding(.horizontal)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("s").ignoresSafeArea(.all, edges: .bottom))
            }
        }
        .onAppear {
                        
            viewModel.timer_sys_start()
        }
    }
}

struct SignalsView_Previews: PreviewProvider {
    static var previews: some View {
        SignalsView()
    }
}
