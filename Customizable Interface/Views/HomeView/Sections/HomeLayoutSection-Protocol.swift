//
//  HomeLayoutSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

/// A protocol that defines the layout for different sections in the home view.
protocol HomeLayoutSection {
    
    /// The type of the home section.
    var type: HomeSection { get }
    
    
    /// The layout shape and style of the section.
    var layoutSection: NSCollectionLayoutSection { get }
    
    
    /**
     Retrieves the cell for the section in the layout.
     
     - Parameters:
        - collectionView: The collection view to which the cell belongs.
        - indexPath: The index path that specifies the location of the cell in the collection view..
        - item: The item that provides data for the cell represented by the HomeSectionItemWarper.
     
     - Returns: A `UICollectionViewCell` object if available, or `nil` if not.
     */
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWarper) -> UICollectionViewCell?

    
    /**
     Retrieves the supplementary view for the  section in the layout.
     
     - Parameters:
        - collectionView: The collection view to which the supplementary view belongs.
        - kind: The kind of supplementary view.
        - indexPath: The index path of the supplementary view.
     
     - Returns: A `UICollectionReusableView` object if available, or `nil` if not.
     */
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView?
}

// MARK: - Default Implementation
extension HomeLayoutSection {
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView? {
        return nil
    }
}

/// An enum that represents different sections type in the layout.
enum HomeSection: Hashable {
    case mainMenu
    case promotedSection
    case offers
    case stores
    case products(id: Int, title: String)
    case banners(id: Int)
}

/// An enum that represents different items type in the section.
enum HomeSectionItemWarper: Hashable {
    case store(StoreModel)
    case product(ProductModel)
    case menuItem(MenuItemModel)
}

