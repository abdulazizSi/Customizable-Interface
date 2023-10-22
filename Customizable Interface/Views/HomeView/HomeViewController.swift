//
//  HomeViewController.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

class HomeViewController: ViewController<HomeView> {
    
    //MARK: - Properties
    
    private let viewModel: HomeViewModel = HomeViewModel()
    
    
    //MARK: - Lifecycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavLogo()
        
        navigationItem.searchController = mainView.searchController
        
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        mainView.collectionView.delegate = self
        
        mainView.collectionView.collectionViewLayout = viewModel.createLayout()
        
        viewModel.createDataSource(collectionView: mainView.collectionView)
        
    }
    
    //MARK: - Functions
    
    private func setupNavLogo() {
        let logo = UIImageView(image: .pazaramaLogo)
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
                
        let customView = UIView(frame: navigationController?.navigationBar.frame ?? .zero)
        customView.addSubview(logo)
        logo.frame = .init(x: 4, y: 0,
                           width: 150,
                           height: customView.frame.height)
                
        navigationItem.titleView = customView
    }
    
}


extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
}
