//
//  ResultVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/5/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    var result: String!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result!
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5729681888, green: 0.8607961256, blue: 1, alpha: 1)
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        let homeScreen = self.storyboard?.instantiateViewController(withIdentifier: "ok")
        UIApplication.shared.keyWindow?.rootViewController = homeScreen
    }
}
