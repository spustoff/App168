//
//  SignalsViewModel.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI

final class SignalsViewModel: ObservableObject {
    
    @Published var colums: [String] = ["All", "Favorites"]
    @Published var current_colum = "All"
    
    @Published var timer_sys = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var isRunned: Bool = false
    
    @Published var time: Int = 59
 
    public func timer_sys_start() {
        
        if time > 0 {
            
            isRunned = true
                        
        } else {

            time = 59
            
        }
    }
    
}
