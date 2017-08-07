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
    
    lazy var mainView : MainView = {
        let mainView = MainView()
        return mainView
    }()
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        mainView.didSelectDelegate = self
        view.addSubview(mainView)
        updateViewConstraints()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = nil
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        mainView <- [
            Edges(0)
        ]
    }
}

extension ViewController: DidSelect {
    func selectedRow(question: Question) {
        let vc = AnswerViewController()
        vc.question = question
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Book.parseSearchQuestions(text: searchText, completion: { (questions) in
            self.mainView.questions = questions
            self.mainView.tableView.reloadData()
        })
    }
}
