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
        
        mainView.collectionView.delegate = self
        
        mainView.collectionView.collectionViewLayout = viewModel.createLayout()
        
        viewModel.createDataSource(collectionView: mainView.collectionView)
        
        dump(viewModel.data)
    }
    
    
}


extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
}
