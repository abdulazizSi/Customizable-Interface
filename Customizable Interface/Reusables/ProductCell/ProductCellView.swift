//
//  ProductCellView.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class ProductCellView: UIView {
    
    //MARK: - Subviews
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let oldPrice: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 11)
        label.isHidden = true
        label.textColor = .lightGray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var priceVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [oldPrice,
                                                   priceLabel])
        stack.axis = .vertical
        stack.spacing = .zero
        return stack
    }()
    
    lazy var labelsVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,
                                                   priceVStackView])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = .init(top: 0, leading: 8, bottom: 8, trailing: 8)
        return stack
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView,
                                                   labelsVStackView])
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    
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
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    private func setupSubviews() {
        addSubview(mainVStackView)
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        mainVStackView.fillToSuperview(.fullSpace())
        
        imageView.anchor(.height(.equalTo(heightAnchor, multiplier: 0.64)))
    }
}

