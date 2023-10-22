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
    
    let action: MenuItemActionType
}

enum MenuItemActionType: String, Decodable {
    case categories
    case category
    case store
    case product
}
