//
//  TopicsViewController.swift
//  IslamFAQ
//
//  Created by Galymzhan Koptleuov on 7/16/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import UIKit
import EasyPeasy
import Parse
import NVActivityIndicatorView

class TopicsViewController: UIViewController, NVActivityIndicatorViewable {

    var subtopics: [String] = []
    var topic = ""
    
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
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var activityIndicatorView: NVActivityIndicatorView = {
        let frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 100, height: 100)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorView.DEFAULT_TYPE, color: NVActivityIndicatorView.DEFAULT_COLOR, padding: NVActivityIndicatorView.DEFAULT_PADDING)
        return activityIndicatorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
        startAnimating(type: .ballPulseSync)
    }
    
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
    
    /*
    private func parseSubtopics() {
        Book.parseSubTopics(topic: topic) { (subtopics) in
            self.subtopics = subtopics
            self.collectionView.reloadData()
            self.stopAnimating()
        }
    }*/
    
}

extension TopicsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subtopics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicIdentifier", for: indexPath) as! BooksCollectionViewCell
        
        cell.titleLabel.text = subtopics[indexPath.row]
        cell.titleLabel.font = cell.titleLabel.font.withSize(30)
        
        return cell
    }
    
}

extension TopicsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc =  QuestionsViewController()
        vc.topic = topic
        vc.subtopic = subtopics[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
