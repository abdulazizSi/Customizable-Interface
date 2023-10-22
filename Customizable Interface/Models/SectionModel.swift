//
//  SectionModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import Foundation

struct SectionModel: Decodable, Hashable {
    let id: Int
    
    let type: SectionType
    
    let title: String
    
    let products: [ProductModel]?
    
    let banners: [MenuItemModel]?
}

enum SectionType: String, Decodable {
    case products
    case banners
}
