//
//  BannersSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

struct BannersSection: HomeLayoutSection {
    
    var type: HomeSection
    
    var layoutSection: NSCollectionLayoutSection {
        let height = NSCollectionLayoutDimension.absolute(180)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: height)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: height)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 6
        
        return section
    }
    
    
    let cellRegistration = UICollectionView.CellRegistration<BannerCell, HomeSectionItemWarper> { cell, indexPath, itemIdentifier in
        if case .menuItem(let banner) = itemIdentifier {
            cell.configure(banner)
        }
    }
    
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWarper) -> UICollectionViewCell? {
        collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    }
    
}
