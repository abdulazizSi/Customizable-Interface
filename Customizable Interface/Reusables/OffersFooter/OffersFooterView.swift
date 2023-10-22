//
//  OffersFooter.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit

class OffersFooterView: UIView {
    
    //MARK: - Subviews
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.pageIndicatorTintColor = .opaqueSeparator
        control.currentPageIndicatorTintColor = .systemBlue
        control.isUserInteractionEnabled = false
        control.hidesForSinglePage = true
        return control
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
        addSubview(pageControl)
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        pageControl.fillToSuperview(.fullSpace())
    }
}

