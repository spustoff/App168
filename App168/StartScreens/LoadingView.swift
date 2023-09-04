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
                
                Image("logo123")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
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
