//
//  LoadingView.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Bimg")
                    .resizable()
                    .ignoresSafeArea()
            }
        
            VStack {
                
                Image("img")
                    .resizable()
            }
            
            VStack {
                
                Image("logo")
                
                Text("Quantum AI")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
            }
            .padding()
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
