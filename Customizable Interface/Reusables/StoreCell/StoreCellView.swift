//
//  StoreCellView.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class StoreCellView: UIView {
    
    //MARK: - Subviews
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
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
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    private func setupSubviews() {
        addSubview(imageView)
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        imageView.fillToSuperview(.fullSpace())
    }
}

