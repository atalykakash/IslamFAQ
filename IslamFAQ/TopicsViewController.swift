//
//  TopicsViewController.swift
//  IslamFAQ
//
//  Created by Galymzhan Koptleuov on 7/16/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import UIKit
import EasyPeasy

class TopicsViewController: UIViewController {

    let books = [
        Book(title: "Topic"), Book(title: "Topic"), Book(title: "Topic"), Book(title: "Topic"),
        Book(title: "Topic"), Book(title: "Topic"), Book(title: "Topic"), Book(title: "Topic")
    ]
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let size: CGFloat = self.view.frame.width
        layout.minimumLineSpacing = 2
        layout.itemSize = CGSize(width: size, height: size / 4)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: "topicIdentifier")
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    
    private func setupViews(){
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.backgroundColor = .red
    }
    
    private func setupLayouts(){
        collectionView <- [
            Edges(0)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
}

extension TopicsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicIdentifier", for: indexPath) as! BooksCollectionViewCell
        
        cell.titleLabel.text = books[indexPath.row].title
        cell.titleLabel.font = cell.titleLabel.font.withSize(30)
        
        return cell
    }
    
}

extension TopicsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc =  QuestionsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
