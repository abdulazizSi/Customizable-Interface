//
//  GenericViewController.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import UIKit

class ViewController<MainView: UIView>: UIViewController {
    
    let mainView = MainView()
 
 
    //MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "Nibs are unsupported")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        self.view = mainView
    }
    
}
