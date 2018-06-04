//
//  AlertController.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/4/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class AlertController {
    static func showAlert (_ inViewController: UIViewController, title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
}
