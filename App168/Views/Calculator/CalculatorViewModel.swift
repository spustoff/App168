//
//  CalculatorViewModel.swift
//  App168
//
//  Created by IGOR on 08/08/2023.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {

    @Published var coins: [String] = ["BTC", "ETH", "XRP", "DOG"]
    @Published var current_coin = "BTC"
    
}
