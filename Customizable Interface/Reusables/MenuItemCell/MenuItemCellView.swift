//
//  MenuItemCell.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class MenuItemCellView: UIView {
    
    //MARK: - Subviews
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView,
                                                   titleLabel])
        stack.axis = .vertical
        stack.spacing = .zero
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
        layer.borderColor = UIColor.border.cgColor
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
        
        imageView.anchor(.height(.constant(70)))
    }
}

