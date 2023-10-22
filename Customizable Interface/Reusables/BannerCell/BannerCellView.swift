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
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView])
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
        backgroundColor = .border
    }
    
    private func setupSubviews() {
        addSubview(mainVStackView)
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        mainVStackView.fillToSuperview(.fullSpace())
    }
}

