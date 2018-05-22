//
//  QuizVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/23/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
    
}
