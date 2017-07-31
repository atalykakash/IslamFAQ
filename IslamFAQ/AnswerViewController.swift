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
    
    var question = Question(question: "", answer: "")
    let questionLabel = UILabel()
    let answerTextView = UITextView()
    
    func setupViews() {
        
        self.view.addSubview(questionLabel)
        self.view.addSubview(answerTextView)
        self.view.backgroundColor = UIColor.white
        
        questionLabel.text = question.questionTitle
        questionLabel.backgroundColor = .white
        questionLabel.textAlignment = .left
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont.boldSystemFont(ofSize: 23)
        questionLabel.adjustsFontSizeToFitWidth = true
        
        answerTextView.text = question.answerTitle
        answerTextView.textAlignment = .left
        answerTextView.font = UIFont.risingSunRegular()
        answerTextView.isEditable = false
        answerTextView.font = answerTextView.font?.withSize(17)
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationItem.title = question.questionTitle
        self.navigationController?.navigationBar.backItem?.title = ""
        
    }
    
    func setupLayouts() {
        questionLabel <- [Size(CGSize(width: self.view.frame.width, height: self.view.frame.height / 7)),
                          Top().to(self.topLayoutGuide), Bottom().to(answerTextView), Right(20), Left(20)
        ]
        
        answerTextView <- [Size(CGSize(width: self.view.frame.width, height: self.view.frame.height / 1.5)),
                           Top().to(questionLabel), Bottom(10), Right(20), Left(15)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
}
