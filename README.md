# Customizable Interface with UICollectionView in Swift

This project demonstrates the creation of a robust, high-performance layout in Swift, leveraging UICollectionViewCompositionalLayout and UICollectionViewDiffableDataSource. 

The implementation is inspired by the design of the pazarama app. It showcases the various sections on the home page, including MenuSection, PromotedSection, OffersSection, and StoresSection. These sections are designed to remain static.

However, the dynamic sections, such as ProductsSection and BannersSection, allow for the addition of multiple items from a JSON file or a backend in a real-world scenario. 

This flexibility makes the app adaptable to various content requirements without compromising performance or user experience and by only using one UICollectionView.

  
## Features
- Programatic UI
- MVVM
- UICollectionViewCompositionalLayout
- UICollectionViewDiffableDataSource
- Supplementary Views (Header + Footer)


## Full Demo
<img src="https://github.com/abdulazizSi/Customizable-Interface/blob/main/gif/fullLayout.gif" width="250" height="500"> &nbsp;&nbsp;&nbsp; <img src="https://github.com/abdulazizSi/Customizable-Interface/blob/main/gif/gridSection.png" width="250" height="500">

## Horizontal Scrolling Sections
<img src="https://github.com/abdulazizSi/Customizable-Interface/blob/main/gif/productSection.gif" width="250" height="500"> &nbsp;&nbsp;&nbsp; <img src="https://github.com/abdulazizSi/Customizable-Interface/blob/main/gif/storeSection.gif" width="250" height="500">

## Slider With Pager
<img src="https://github.com/abdulazizSi/Customizable-Interface/blob/main/gif/sliderSection.gif" width="250" height="500"> &nbsp;&nbsp;&nbsp; <img src="https://github.com/abdulazizSi/Customizable-Interface/blob/main/gif/horizontalSections.png" width="250" height="500">

## Super Clean impelemntation
Creating of the data source
``` swift
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
```
A protocl to build the section
``` swift
/// A protocol that defines the layout for different sections in the home view.
protocol HomeLayoutSection {
    
    /// The type of the home section.
    var type: HomeSection { get }
    
    
    /// The layout shape and style of the section.
    var layoutSection: NSCollectionLayoutSection { get }
    
    
    /**
     Retrieves the cell for the section in the layout.
     
     - Parameters:
        - collectionView: The collection view to which the cell belongs.
        - indexPath: The index path that specifies the location of the cell in the collection view..
        - item: The item that provides data for the cell represented by the HomeSectionItemWarper.
     
     - Returns: A `UICollectionViewCell` object if available, or `nil` if not.
     */
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWarper) -> UICollectionViewCell?

    
    /**
     Retrieves the supplementary view for the  section in the layout.
     
     - Parameters:
        - collectionView: The collection view to which the supplementary view belongs.
        - kind: The kind of supplementary view.
        - indexPath: The index path of the supplementary view.
     
     - Returns: A `UICollectionReusableView` object if available, or `nil` if not.
     */
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView?
}
```
An example of building a new section by conforming to the HomeLayoutSection protocol
``` swift

struct MenuSection: HomeLayoutSection {
    
    var type: HomeSection = .mainMenu
    
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let spacing: CGFloat = 6
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(110))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        group.interItemSpacing = .fixed(spacing)
        
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.interGroupSpacing = spacing
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.boundarySupplementaryItems = [footer]
        
        return section
    }
    
    
    let cellRegistration = UICollectionView.CellRegistration<MenuItemCell, HomeSectionItemWarper> { cell, indexPath, itemIdentifier in
        if case .menuItem(let item) = itemIdentifier {
            cell.configure(item)
        }
    }
    
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWarper) -> UICollectionViewCell? {
        collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    }

    let footer = UICollectionView.SupplementaryRegistration<MainMenuFooter>(elementKind: UICollectionView.elementKindSectionFooter) { supplementaryView, elementKind, indexPath in
        
    }
    
    func supplementary(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView? {
        collectionView.dequeueConfiguredReusableSupplementary(using: footer, for: indexPath)
    }
    
}
```
After retrieving the data from the backend, it can be effortlessly appended to the section if the section's data is not nil.
``` swift
/// Reload sections
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
```

## Requirements
- iOS 14+
- Swift 5+
- Xcode 12+

## Contact

Feel free to reach out with issues, questions or anything else.

- <p><a href="mailto:abdulaziz.si.aa@gmail.com">Send Email</a></p>
- [Follow on LinkedIn](https://linkedin.com/in/abdulaziz-alsikh-1225a2120)
