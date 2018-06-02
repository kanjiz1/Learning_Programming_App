//
//  DataService.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/25/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation
class DataService{
     static let instance = DataService()
    //Maps, Pathway
    private let languages = [LearningTopic(title: "Java", imageName: "java.jpg"),
                             LearningTopic(title: "C++", imageName: "C++.png"),
                             LearningTopic(title: "Swift", imageName: "swift-og.png")]
    
    
    private let learning = [(LearningTopic(title: "Algorithms", imageName: "algorithms.png")),
                            LearningTopic(title: "Data Structures", imageName:"dataStructures.png"),
                            LearningTopic(title: "Regular Expressions", imageName: "RegEx.png")]
    
    private let wikipedia = LearningTopic(title: "Wikipedia", imageName: "wikipedia.png")
    
    func getLanguages() -> [LearningTopic]{
        return languages
    }
    
    func getLearning() -> [LearningTopic] {
        return learning
    }
    
    //What to do when a language is clicked
    func getLanguageQuestions(forLanguageTitle title:String){
        
    }
    
    
    
}
