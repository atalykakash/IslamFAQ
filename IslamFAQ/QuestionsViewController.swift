//
//  QuestionsViewController.swift
//  IslamFAQ
//
//  Created by Galymzhan Koptleuov on 7/16/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import UIKit
import EasyPeasy

class QuestionsViewController: UIViewController {

    let questions = [
        Question(question: "Kimsin sen?", answer: "Kimmin men?"), Question(question: "Kimsin sen?", answer: "Kimmin men?"),
        Question(question: "Kimsin sen?", answer: "Kimmin men?"), Question(question: "Kimsin sen?", answer: "Kimmin men?"),
        Question(question: "Kimsin sen?", answer: "Kimmin men?"), Question(question: "Kimsin sen?", answer: "Kimmin men?")
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
        collectionView.register(QuestionCollectionViewCell.self, forCellWithReuseIdentifier: "questionID")
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

extension QuestionsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "questionID", for: indexPath) as! QuestionCollectionViewCell
        
        cell.questionLabel.text = questions[indexPath.row].questionTitle
        cell.answerLabel.text = questions[indexPath.row].answerTitle
        
        return cell
    }
    
}

extension QuestionsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc =  AnswerViewController()
        vc.questions = questions
        vc.index = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
