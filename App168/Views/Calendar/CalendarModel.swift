//
//  CalendarModel.swift
//  App168
//
//  Created by IGOR on 08/08/2023.
//

import SwiftUI

struct CalendarResponseModel: Codable, Hashable {

    var results: [CalendarModel]
}

struct CalendarModel: Codable, Hashable {
 
    var resultIdItem: Int?
    var resultCurrencyItem: String?
    var resultBuyItem: Int?
    var resultSellItem: Int?
    var resultCreated_atItem: String?
    var resultUpdated_atItem: String?

}
