//
//  TitleHeader.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class TitleHeader: CollectionReusableView<TitleHeaderView> {
    func configure(title: String) {
        mainView.titleLabel.text = title
    }
    
}
