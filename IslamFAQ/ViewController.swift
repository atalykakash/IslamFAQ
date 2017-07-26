//
//  ViewController.swift
//  IslamFAQ
//
//  Created by Galymzhan Koptleuov on 7/13/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import UIKit
import EasyPeasy
import NVActivityIndicatorView
import AnimatedCollectionViewLayout

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    let mainView : MainView = {
        let mainView = MainView()
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(mainView)
        updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        mainView <- [
            Edges(0)
        ]
    }

}


