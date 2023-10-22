//
//  ProductsSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

struct ProductsSection: HomeLayoutSection {
    
    var type: HomeSection
    
    let header: UICollectionView.SupplementaryRegistration<TitleHeader>

    init(type: HomeSection) {
        self.type = type
        
        var sectionTitle = String()
        if case .products(_, let title) = type {
            sectionTitle = title
        }
        
        header = UICollectionView.SupplementaryRegistration<TitleHeader>(elementKind: UICollectionView.elementKindSectionHeader) { supplementaryView, elementKind, indexPath in
            supplementaryView.configure(title: sectionTitle)
        }
    }
    
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.39), heightDimension: .absolute(360))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 6
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    
    let cellRegistration = UICollectionView.CellRegistration<ProductCell, HomeSectionItemWarper> { cell, indexPath, itemIdentifier in
        if case .product(let product) = itemIdentifier {
            cell.configure(product)
        }
    }
    
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWarper) -> UICollectionViewCell? {
        collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    }

    
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView? {
        collectionView.dequeueConfiguredReusableSupplementary(using: header, for: indexPath)
    }
}
