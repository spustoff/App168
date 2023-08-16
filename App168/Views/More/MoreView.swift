//
//  MoreView.swift
//  App168
//
//  Created by IGOR on 09/08/2023.
//

import SwiftUI
import StoreKit

struct MoreView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("More")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                
                VStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Rate Us")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                        .padding(.horizontal)
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1Hw2hePEOTVNK61SQX63ZL9GkgndDRGtkd3WyCoJ-HLM/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                        .padding(.horizontal)
                    })
                    
                    Spacer()

                }
                .padding(.top)
                .background(Color("s").ignoresSafeArea(.all, edges: .bottom))
            }
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
