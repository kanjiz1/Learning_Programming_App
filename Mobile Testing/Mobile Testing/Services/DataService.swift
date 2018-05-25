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
    
    private let languages = [Language(title: "Java", imageName: "java.jpg"),
                             Language(title: "C++", imageName: "C++.png"),
                             Language(title: "Swift", imageName: "swift-og.png")]
    
    func getLanguages() -> [Language]{
        return languages
    }
    
    //What to do when a language is clicked
    func getLanguageQuestions(forLanguageTitle title:String){
        
    }
    
    
    
}
