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

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    var books: [Book] = []
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let size: CGFloat = self.view.frame.width
        layout.minimumLineSpacing = 2
        layout.itemSize = CGSize(width: size, height: size / 3)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: "bookIdentifier")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private func setupViews(){
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.backgroundColor = .white
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
        startAnimating(type: .ballPulseSync)
        parseTopics()
    }
    
    private func parseTopics () {
        Book.parseTopics { (books) in
            self.books = books
            self.collectionView.reloadData()
            self.stopAnimating()
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookIdentifier", for: indexPath) as! BooksCollectionViewCell
        
        cell.titleLabel.text = books[indexPath.row].title
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc =  TopicsViewController()
        vc.topic = books[indexPath.row].title!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


