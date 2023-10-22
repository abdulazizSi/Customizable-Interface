//
//  OffersFooter.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 22.10.2023.
//

import UIKit


class OffersFooter: CollectionReusableView<OffersFooterView> {
    
    private var didRegisterForNotification = false
    
    private var currentPage: Int = 0 {
        didSet {
            guard oldValue != currentPage else {return}
            mainView.pageControl.currentPage = currentPage
        }
    }
    
    func configure(numberOfPages: Int, id: Notification.Name) {
        mainView.pageControl.numberOfPages = numberOfPages
        
        guard !didRegisterForNotification else {return}
                
        NotificationCenter.default.addObserver(forName: id, object: nil, queue: .main) { [weak self] notification in
            guard let index = notification.object as? Int else {return}
            self?.currentPage = index
        }
        
        didRegisterForNotification = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        removeObserver()
    }
    
    deinit {
        removeObserver()
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self)
        didRegisterForNotification = false
    }
}
