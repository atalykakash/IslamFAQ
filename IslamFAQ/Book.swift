//
//  Book.swift
//  IslamFAQ
//
//  Created by Galymzhan Koptleuov on 7/16/17.
//  Copyright © 2017 Adilkhan Khassanov. All rights reserved.
//

import Foundation
import Parse

struct Book {
    let title: String?
    
    init(title: String) {
        self.title = title
    }
    
    static func parseTopics(completion: @escaping ([Book]) -> ()) {
        
        var books: [Book] = []
        
        let query = PFQuery(className: "Topic")
        query.findObjectsInBackground { (result, error) in
            if let objects = result {
                for object in objects {
                    guard let topic = object["topic"] as? String else {
                        return
                    }
                    let book = Book(title: topic)
                    books.append(book)
                }
            }
            completion(books)
        }
    }
    
    static func parseSubTopics(topic: String, completion: @escaping ([String]) -> ()) {
            
            var subtopics: [String] = []
            
            let query = PFQuery(className: "Subtopic")
            query.whereKey("topic", equalTo: topic)
            query.findObjectsInBackground { (result, error) in
                if let objects = result {
                    for object in objects {
                        guard let subtopic = object["subtopic"] as? String else {
                            return
                        }
                        subtopics.append(subtopic)
                    }
                }
                completion(subtopics)
        }
    }
    
    static func parseQuestions(topic: String, subtopic: String, completion: @escaping ([Question]) -> ()) {
        
        var questions: [Question] = []
        
        let query = PFQuery(className: "Question")
        query.whereKey("topic", equalTo: topic)
        query.whereKey("subtopic", equalTo: subtopic)
        query.findObjectsInBackground { (result, error) in
            if let objects = result {
                for object in objects {
                    guard let question = object["question"] as? String, let answer = object["answer"] as? String else {
                        return
                    }
                    let q = Question(question: question, answer: answer)
                    questions.append(q)
                }
            }
            completion(questions)
        }
    }
}
