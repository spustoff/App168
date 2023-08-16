//
//  NewsModel.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI

struct NewsModel: Codable, Hashable {
    
    var errors: Bool
    
    var rows: [VideoItem]
}

struct VideoItem: Codable, Hashable {
    
    var id: Int?
    var categoryId: Int?
    var title: String?
    var image: String?
    var video: String?
    
    var duration: Int?
}
