//
//  StoreModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import Foundation

struct StoreModel: Decodable, Hashable {
    let id: Int
    
    let name: String
    
    let img: String
}
