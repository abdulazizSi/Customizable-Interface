//
//  ProductCell.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class ProductCell: CollectionViewCell<ProductCellView> {
    func configure(_ product: ProductModel) {
        let image = UIImage(named: product.img)?.resizeImage(targetSize: contentView.bounds.size)
        mainView.imageView.image = image
        
        mainView.titleLabel.text = product.name

        setPrice(product)
    }
        
    private func setPrice(_ product: ProductModel) {
        if let discount = product.discount {
            mainView.oldPrice.isHidden = false
            let formattedPriceString = String(format: "%.2f", product.price) + "TL"
            mainView.oldPrice.text = formattedPriceString
            let attributedString = NSAttributedString(string: formattedPriceString,
                                                      attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            mainView.oldPrice.attributedText = attributedString
            
            formatePrice(price: discount)
        } else {
            mainView.oldPrice.isHidden = true
            formatePrice(price: product.price)
        }
    }
    
    
    private func formatePrice(price: Double) {
        let priceString = String(Int(price))

        let formattedPriceString = String(format: "%.2f", price) + "TL"
        let attributedString = NSMutableAttributedString(string: formattedPriceString)
        
        // Find the range of the price in the attributed string
        if let range = formattedPriceString.range(of: priceString) {
            let nsRange = NSRange(range, in: formattedPriceString)
            attributedString.addAttributes([.font: UIFont.systemFont(ofSize: 20)], range: nsRange)
        }
        
        mainView.priceLabel.attributedText = attributedString
    }
}
