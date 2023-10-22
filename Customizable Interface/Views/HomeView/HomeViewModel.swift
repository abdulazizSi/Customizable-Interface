//
//  HomeViewModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

class HomeViewModel {
    
    //MARK: - Properties
    
    private(set) var data: HomeModel = Bundle.main.decode(HomeModel.self, from: "HomeModelData.json")
    
    private(set) var sections: [HomeLayoutSection] = []
    
    private(set) var datasource: UICollectionViewDiffableDataSource<HomeSection, HomeSectionItemWarper>!
    
    
    //MARK: - Functions
    
    /// Create the collectionView compositionalLayout
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            self?.sections[sectionIndex].layoutSection
        }
                
        layout.configuration = layoutConfiguration()
        
        return layout
    }
    
    
    /// CollectionView layout Configuration
    private func layoutConfiguration() -> UICollectionViewCompositionalLayoutConfiguration {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        
        config.interSectionSpacing = 16
        
        return config
    }
    
    
    /// Create the data source according to the sections
    func createDataSource(collectionView: UICollectionView) {
        datasource = .init(collectionView: collectionView) { [weak self] collectionView, indexPath, item in
            self?.sections[indexPath.section].cell(collectionView, indexPath, item)
        }
        
        datasource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            self?.sections[indexPath.section].supplementary(collectionView, kind: kind, indexPath)
        }
        
        reloadSections()
    }
 
    /// Reload sections data
    private func reloadSections() {
        if !data.mainMenu.isEmptyOrNil {
            sections.append(MenuSection())
        }

        if data.promotedSection != nil {
            sections.append(PromotedSection())
        }
                    
        if !data.offers.isEmptyOrNil {
            sections.append(OffersSection(type: .offers, numberOfItems: data.offers?.count ?? 0))
        }
        
        if !data.stores.isEmptyOrNil {
            sections.append(StoresSection())
        }
        
        if let dynamicSections = data.dynamicSections {
            dynamicSections.forEach { section in
                switch section.type {
                case .products:
                    sections.append(ProductsSection(type: .products(id: section.id, title: section.title)))
                case .banners:
                    sections.append(BannersSection(type: .banners(id: section.id)))
                }
            }            
        }
        
        reloadData()
    }
    
    /// Reload data source
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeSectionItemWarper>()
        
        sections.forEach { section in
            switch section.type {
            case .mainMenu:
                guard let menu = data.mainMenu else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(menu.map{.menuItem($0)}, toSection: section.type)
                
            case .stores:
                guard let stores = data.stores else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(stores.map{.store($0)}, toSection: section.type)
                
            case .offers:
                guard let offers = data.offers else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(offers.map{.menuItem($0)}, toSection: section.type)
                
            case .promotedSection:
                guard let promotedSection = data.promotedSection else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems([.menuItem(promotedSection)], toSection: section.type)
                
            case .banners(let id):
                guard let bannersSection = data.dynamicSections?.first(where: { $0.id == id}),
                      let banners = bannersSection.banners
                else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(banners.map{.menuItem($0)}, toSection: section.type)
                
            case .products(let id, _):
                guard let productsSection = data.dynamicSections?.first(where: { $0.id == id}),
                      let products = productsSection.products
                else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(products.map{.product($0)}, toSection: section.type)            
            }
        }
        
        datasource.apply(snapshot)
    }
    
    
    /// Handle selecting item
    /// - Parameter indexPath: index of the selected item
    func didSelectItem(at indexPath: IndexPath) {
        guard let item = datasource.itemIdentifier(for: indexPath) else {
            print("Item not found")
            return
        }
                
        switch item {
        case let .product(productModel):
            print(productModel) /// Show product details
            
        case let .store(store):
            print(store) /// Show store details
            
        case let .menuItem(banner):
            print(banner) /// Show banner details
        }
    }
}

