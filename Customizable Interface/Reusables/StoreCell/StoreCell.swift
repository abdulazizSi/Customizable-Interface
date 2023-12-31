//
//  StoreCell.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class StoreCell: CollectionViewCell<StoreCellView> {
    override func prepareForReuse() {
        super.prepareForReuse()
        mainView.imageView.image = nil
    }
    
    func configure(_ store: StoreModel) {
        let image = UIImage(named: store.img)?.resizeImage(targetSize: contentView.bounds.size)
        mainView.imageView.image = image
    }
}
