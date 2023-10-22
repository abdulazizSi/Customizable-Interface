//
//  GenericCollectionReusableView.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class CollectionReusableView<MainView: UIView>: UICollectionReusableView {
   
    let mainView = MainView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainView)
        mainView.fillToSuperview(.fullSpace())
    }
    
    @available(*, unavailable, message: "Nibs are unsupported")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}


