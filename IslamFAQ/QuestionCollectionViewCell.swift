//
//  QuestionCollectionViewCell.swift
//  IslamFAQ
//
//  Created by Galymzhan Koptleuov on 7/17/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import UIKit
import EasyPeasy

class QuestionCollectionViewCell: UICollectionViewCell {
    
    let questionLabel = UILabel()
    let answerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(questionLabel)
        self.contentView.addSubview(answerLabel)
        self.contentView.backgroundColor = .white
        
        questionLabel.textAlignment = .center
        answerLabel.textAlignment = .center
        
        questionLabel <- [Size(CGSize(width: self.frame.width, height: self.frame.height/2)),
                          Top()]
        answerLabel <- [Size(CGSize(width: self.frame.width, height: self.frame.height/2)),
                        Top().to(questionLabel)]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
