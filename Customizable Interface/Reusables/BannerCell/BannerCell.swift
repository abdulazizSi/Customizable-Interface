//
//  BannerCell.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class BannerCell: CollectionViewCell<BannerCellView> {
    
    func configure(_ data: MenuItemModel) {
        mainView.imageView.image = .init(named: data.img)
    }
    
}
