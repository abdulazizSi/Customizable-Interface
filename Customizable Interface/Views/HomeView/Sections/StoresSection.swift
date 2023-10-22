//
//  StoresSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

struct StoresSection: HomeLayoutSection {
    
    var type: HomeSection = .stores
    
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.27), heightDimension: .absolute(75))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 6
        
        return section
    }
    
    
    let cellRegistration = UICollectionView.CellRegistration<StoreCell, HomeSectionItemWarper> { cell, indexPath, itemIdentifier in
        if case .store(let store) = itemIdentifier {
            cell.configure(store)
        }
    }
    
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWarper) -> UICollectionViewCell? {
        collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    }
    
}




