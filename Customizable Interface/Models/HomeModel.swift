//
//  HomeModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import Foundation

struct HomeModel {
    /// Static Sections
    /// you can move any of this sections inside the dynamic sections and create a new type
    let categories: [CategoryModel]?
    
    let stores: [StoreModel]?
        
    let offers: [BannerModel]?
    
    let promotedSection: BannerModel?
    
    
    
    /// Dynamic Sections
    let dynamicSections: [SectionModel]?
}
