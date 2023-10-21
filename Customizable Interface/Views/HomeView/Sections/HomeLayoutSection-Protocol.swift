//
//  HomeLayoutSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

protocol HomeLayoutSection {
    var type: HomeSection {get}
    
    var layoutSection: NSCollectionLayoutSection {get}
    
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWarper) -> UICollectionViewCell?
    
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView?
        
}

extension HomeLayoutSection {
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView? {
        return nil
    }
}

enum HomeSection: Hashable {
    case categories
    case stores
    case offers
    case promotedSection
    case products(id: Int)
    case banners(id: Int)
}

enum HomeSectionItemWarper: Hashable {
    case category(CategoryModel)
    case store(StoreModel)
    case product(ProductModel)
    case banner(BannerModel)
}
