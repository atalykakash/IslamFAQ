//
//  TopicTableView.swift
//  IslamFAQ
//
//  Created by Admin on 7/26/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import UIKit
import EasyPeasy
import AnimatedCollectionViewLayout

class MainView: UIView {
    
    var books: [Book] = []
    var questions: [Question] = []
    
    lazy var layout: AnimatedCollectionViewLayout = {
        let layout = AnimatedCollectionViewLayout()
        let width: CGFloat = Constants.screenWidth
        let height: CGFloat = Constants.screenHeight
        layout.minimumLineSpacing = 2
        layout.itemSize = CGSize(width: width, height: height*0.2)
        layout.scrollDirection = .horizontal
        layout.animator = LinearCardAttributesAnimator()
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: "TopicCell")
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        return collectionView
    }()

    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: "QuestionCell")
        tableView.rowHeight = Constants.screenHeight*0.1
        tableView.backgroundColor = .green
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        updateConstraints()
        parseTopics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        self.addSubview(tableView)
        tableView.dataSource = self
        
        self.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        collectionView <- [
            Top(0),
            Left(0),
            Width(Constants.screenWidth),
            Height(Constants.screenHeight*0.3)
        ]
        
        tableView <- [
            Top(0).to(collectionView),
            Left(0),
            Width(Constants.screenWidth),
            Height(Constants.screenHeight*0.7)
        ]
    }
    
    private func parseTopics() {
        Book.parseTopics { (books) in
            self.books = books
            self.collectionView.reloadData()
            //self.stopAnimating()
        }
    }
    
    func parseQuestions(topic: String) {
        Book.parseQuestions(topic: topic) { (questions) in
            self.questions = questions
            self.tableView.reloadData()
        }
    }

}

extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTableViewCell
        
        cell.questionLabel.text = questions[indexPath.row].questionTitle
        
        return cell
    }
}

extension MainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension MainView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let title = books[indexPath.row].title {
            parseQuestions(topic: title)
        }
    }
}

extension MainView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicCell", for: indexPath) as! BooksCollectionViewCell
        
        cell.titleLabel.text = books[indexPath.row].title
        
        return cell
    }
}

extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(Constants.screenHeight*0.08, 0, 0, 0)
    }
}
