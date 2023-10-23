//
//  NSCollectionLayoutSection-bannerLayoutSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 23.10.2023.
//

import UIKit

extension NSCollectionLayoutSection {
    static func bannerLayoutSection() -> NSCollectionLayoutSection {
        let height = NSCollectionLayoutDimension.absolute(180)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: height)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: height)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets.leading = 16
        group.contentInsets.trailing = 16
        
        let section = NSCollectionLayoutSection(group: group)

        section.interGroupSpacing = 6
        
        return section
    }
}

extension NSCollectionLayoutSection {
    func addTitleHeader() {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        boundarySupplementaryItems += [header]
    }
}
