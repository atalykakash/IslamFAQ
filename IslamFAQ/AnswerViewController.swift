//
//  AnswerViewController.swift
//  IslamFAQ
//
//  Created by Galymzhan Koptleuov on 7/17/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import UIKit
import EasyPeasy

class AnswerViewController: UIViewController {
    
    var questions: [Question] = []
    var index = 0
    
    let questionLabel = UILabel()
    
    let answerTextView = UITextView()
    
    func setupViews() {
        self.view.addSubview(questionLabel)
        self.view.addSubview(answerTextView)
        
        questionLabel.text = questions[index].questionTitle
        questionLabel.backgroundColor = .white
        questionLabel.textAlignment = .center
        answerTextView.text = questions[index].answerTitle
        answerTextView.textAlignment = .center
        
    }
    
    func setupLayouts() {
        questionLabel <- [Size(CGSize(width: self.view.frame.width, height: self.view.frame.height / 7)),
                          Top(20), Bottom(500), Right(10), Left(10)
                         ]
        
        answerTextView <- [Size(CGSize(width: self.view.frame.width - 10, height: self.view.frame.height / 1.5)),
                           Top(10).to(questionLabel), Bottom(5)
                          ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }

}
