//
//  MainMenuFooterView.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class MainMenuFooterView: UIView {
    
    //MARK: - Subviews
    let bouncePointsImageView: UIImageView = {
        let imageView = UIImageView(image: .bouncePoints)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    let bankImageView: UIImageView = {
        let imageView = UIImageView(image: .bankImg)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bouncePointsImageView,
                                                   bankImageView])
        stack.axis = .vertical
        stack.spacing = 2
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
        
    }
    
    private func setupSubviews() {
        addSubview(mainVStackView)
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        mainVStackView.fillToSuperview(.fullSpace(padding: .init(top: 8, left: 0, bottom: 0, right: 0)))
        
        bouncePointsImageView.anchor(.height(.constant(40)))
        
        bankImageView.anchor(.height(.constant(45)))
    }
}

