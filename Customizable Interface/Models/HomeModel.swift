//
//  HomeModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import Foundation

struct HomeModel: Decodable {
    /// Static Sections
    /// you can move any of this sections inside the dynamic sections and create a new type
    let mainMenu: [MenuItemModel]?
    
    let stores: [StoreModel]?
        
    let offers: [MenuItemModel]?
    
    let promotedSection: MenuItemModel?
    
    
    
    /// Dynamic Sections
    let dynamicSections: [SectionModel]?
}
