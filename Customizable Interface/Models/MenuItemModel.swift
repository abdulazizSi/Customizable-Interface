//
//  MenuItemModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import Foundation

struct MenuItemModel: Decodable, Hashable {
    let id: Int
    
    let name: String
    
    let img: String
    
    let action: BannerActionTypes
}

enum BannerActionTypes: String, Decodable {
    case category
    case store
    case product
}
