//
//  HomeView.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

class HomeView: UIView {
    
    //MARK: - Subviews
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    let searchController = UISearchController()
    
    
    //MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup
    
    private func setup() {
        backgroundColor = .display
    }
    
    private func setupSubviews() {
        addSubview(collectionView)
        
    }
    
    
    //MARK: - Constraint
    
    private func layoutConstraint() {
        collectionView.fillToSuperview(.fullSpace())
    }
}

