//
//  CustomCell.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/25/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell{
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
  
    func updateViews(category: LearningTopic){
        cellImage.image = UIImage(named: category.imageName)
        cellTitle.text = category.title
    }
}
