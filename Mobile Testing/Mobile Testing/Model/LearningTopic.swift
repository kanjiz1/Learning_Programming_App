//
//  Language.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/25/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation
struct LearningTopic {
    private (set) public var title: String
    private(set) public var imageName: String
    
    init(title:String, imageName:String) {
        self.title = title
        self.imageName = imageName
    }
}
