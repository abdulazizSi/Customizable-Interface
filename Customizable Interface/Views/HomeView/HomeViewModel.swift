//
//  HomeViewModel.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

class HomeViewModel {
    
    //MARK: - Properties
    
    let data: HomeModel? = nil
    
    var sections: [HomeLayoutSection] = []
    
    var datasource: UICollectionViewDiffableDataSource<HomeSection, HomeSectionItemWarper>!
    
    
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
        
        config.interSectionSpacing = 35
        
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
    }
 
    /// Reload sections data
    private func reloadSections() {
        guard let data else {return}
        
        if data.categories.isEmptyOrNil {
            sections.append(ProductsSection(type: .categories))
        }
        
        if data.stores.isEmptyOrNil {
            sections.append(ProductsSection(type: .stores))
        }
            
        if data.offers.isEmptyOrNil {
            sections.append(ProductsSection(type: .offers))
        }
        
        if data.promotedSection != nil {
            sections.append(ProductsSection(type: .promotedSection))
        }
        
        if let dynamicSections = data.dynamicSections {
            dynamicSections.forEach { section in
                switch section.type {
                case .products:
                    sections.append(ProductsSection(type: .products(id: section.id)))
                case .banner:
                    sections.append(BannersSection(type: .banners(id: section.id)))
                }
            }            
        }
        
        reloadData()
    }
    
    /// Reload data source
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeSectionItemWarper>()
        
        sections.forEach { section in
            switch section.type {
            case .categories:
                guard let mainCategories = data?.categories else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(mainCategories.map{.category($0)}, toSection: section.type)
                
            case .stores:
                guard let categories = data?.categories else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(categories.map{.category($0)}, toSection: section.type)
                
            case .offers:
                guard let categories = data?.categories else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(categories.map{.category($0)}, toSection: section.type)
                
            case .promotedSection:
                guard let categories = data?.categories else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(categories.map{.category($0)}, toSection: section.type)
                
            case .banners(let id):
                guard let bannersSection = data?.dynamicSections?.first(where: { $0.id == id}),
                      let banners = bannersSection.banners
                else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(banners.map{.banner($0)}, toSection: section.type)
                
            case .products(let id):
                guard let productsSection = data?.dynamicSections?.first(where: { $0.id == id}),
                      let products = productsSection.products
                else {return}
                snapshot.appendSections([section.type])
                snapshot.appendItems(products.map{.product($0)}, toSection: section.type)            
            }
        }
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
            
        case let .category(category):
            print(category) /// Show category details
            
        case let .store(store):
            print(store) /// Show store details
            
        case let .banner(banner):
            print(banner) /// Show banner details
        }
    }
}

