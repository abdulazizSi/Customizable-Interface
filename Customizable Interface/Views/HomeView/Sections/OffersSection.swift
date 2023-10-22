//
//  OffersSection.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

struct OffersSection: HomeLayoutSection {
    
    var type: HomeSection = .offers
    
    let footer: UICollectionView.SupplementaryRegistration<OffersFooter>
            
    private let notificationId: Notification.Name
    
    
    init(type: HomeSection, numberOfItems: Int) {
        self.type = type
        
        let notificationId: Notification.Name = .init("offerSection.footer.id.\(UUID())")
        
        self.notificationId = notificationId
        
        footer = UICollectionView.SupplementaryRegistration<OffersFooter>(elementKind: UICollectionView.elementKindSectionFooter) { supplementaryView, elementKind, indexPath in
            supplementaryView.configure(numberOfPages: numberOfItems, id: notificationId)
        }
        
    }
        
    var layoutSection: NSCollectionLayoutSection {
        let height = NSCollectionLayoutDimension.absolute(180)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: height)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: height)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.boundarySupplementaryItems = [footer]
        section.visibleItemsInvalidationHandler = { visibleItems, point, environment in
            guard let itemIndex = visibleItems.last?.indexPath.item else {return}
            NotificationCenter.default.post(name: notificationId, object: itemIndex)
        }
        
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

    
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView? {
        collectionView.dequeueConfiguredReusableSupplementary(using: footer, for: indexPath)
    }
}
