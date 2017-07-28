//
//  BooksCollectionViewCell.swift
//  IslamFAQ
//
//  Created by Galymzhan Koptleuov on 7/16/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import UIKit
import EasyPeasy

class BooksCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel : UILabel = {
       let label = UILabel()
       label.font = UIFont.risingSunRegular().withSize(40)
       label.textAlignment = .center
       return label
    }()
    
    lazy var picImageView : UIImageView = {
       let picImageView = UIImageView()
       picImageView.layer.cornerRadius = 5
       picImageView.layer.masksToBounds = true
       picImageView.image = UIImage(named: "cami")
       return picImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = true
        
        self.addSubview(picImageView)
        self.addSubview(titleLabel)
        
        picImageView <- [
            Top(0),
            Left(0),
            Width(frame.width),
            Height(frame.height*0.8)
        ]
        
        titleLabel <- [
            Top(0).to(picImageView),
            Left(0),
            Width(frame.width),
            Height(frame.height*0.2)
        ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
