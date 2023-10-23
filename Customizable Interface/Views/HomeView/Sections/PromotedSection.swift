//
//  PromotedSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

struct PromotedSection: HomeLayoutSection {
    
    var type: HomeSection = .promotedSection
    
    var layoutSection: NSCollectionLayoutSection {
        .bannerLayoutSection()
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
