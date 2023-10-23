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
        
        let notificationId: Notification.Name = .init("offersSection.footer.id.\(UUID())")
        
        self.notificationId = notificationId
        
        footer = UICollectionView.SupplementaryRegistration<OffersFooter>(elementKind: UICollectionView.elementKindSectionFooter) { supplementaryView, elementKind, indexPath in
            supplementaryView.configure(numberOfPages: numberOfItems, id: notificationId)
        }
        
    }
        
    var layoutSection: NSCollectionLayoutSection {
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        
        let section: NSCollectionLayoutSection = .bannerLayoutSection()
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.boundarySupplementaryItems = [footer]
        
        section.visibleItemsInvalidationHandler = { visibleItems, point, environment -> Void in
            let page = round(point.x / environment.container.contentSize.width)
            NotificationCenter.default.post(name: notificationId, object: page)
        }
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

    
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView? {
        collectionView.dequeueConfiguredReusableSupplementary(using: footer, for: indexPath)
    }
}
