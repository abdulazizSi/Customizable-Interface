//
//  BannerModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import Foundation

struct BannerModel: Hashable {
    let id: Int
    
    let name: String
    
    let img: String
    
    let action: BannerActionTypes
}

enum BannerActionTypes {
    case category
    case store
    case product
}
