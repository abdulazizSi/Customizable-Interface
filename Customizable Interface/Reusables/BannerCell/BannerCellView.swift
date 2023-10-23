//
//  BannerCellView.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class BannerCellView: UIView {
    
    //MARK: - Subviews
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
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
        backgroundColor = .border
    }
    
    private func setupSubviews() {
        addSubview(imageView)
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        imageView.fillToSuperview(.fullSpace())
    }
}

