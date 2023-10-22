//
//  MenuItemCell.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class MenuItemCell: CollectionViewCell<MenuItemCellView> {
    func configure(_ data: MenuItemModel) {
        mainView.titleLabel.text = data.name
        
        mainView.imageView.image = UIImage(named: data.img)
    }
    
}
