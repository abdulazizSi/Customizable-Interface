//
//  OffersSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

struct OffersSection: HomeLayoutSection {
    
    var type: HomeSection = .offers
    
    var layoutSection: NSCollectionLayoutSection {
        let height = NSCollectionLayoutDimension.absolute(180)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: height)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: height)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    
    let cellRegistration = UICollectionView.CellRegistration<BannerCell, HomeSectionItemWarper> { cell, indexPath, itemIdentifier in
        if case .menuItem(let banner) = itemIdentifier {
            cell.configure(banner)
            cell.mainView.mainVStackView.isLayoutMarginsRelativeArrangement = true
            cell.mainView.mainVStackView.directionalLayoutMargins = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        }
    }
    
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWarper) -> UICollectionViewCell? {
        collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    }
    
}
