//
//  SectionModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import Foundation

struct SectionModel {
    let type: SectionType
    
    let id: Int
    
    let title: String
    
    let products: [ProductModel]?
    
    let banners: [BannerModel]?
}

enum SectionType {
    case products
    case banner
}
