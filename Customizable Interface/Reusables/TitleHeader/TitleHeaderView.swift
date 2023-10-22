//
//  TitleHeader.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class TitleHeaderView: UIView {
    
    //MARK: - Subviews
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
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
        addSubview(titleLabel)
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        titleLabel.fillToSuperview(.fullSpace(padding: .init(top: 0, left: 0, bottom: 8, right: 0)))
    }
}

