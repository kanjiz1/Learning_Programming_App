//
//  QuizVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/23/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import SnapKit

class QuizVC: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        navigationController?.navigationBar.topItem?.title = "Hey! Welcome!"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        menuButton.customView?.snp.makeConstraints({ (make) in
            make.width.equalTo(10)
            make.height.equalTo(10)
        })
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
    
}


/*
MENUBAR ITEM CONSTRAINTS

 let button = UIButton()
 button.setImage(UIImage(named: "btn-img"), for: .normal)
 button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
 let barItem = UIBarButtonItem(customView: button)
 
 let width = barItem.customView?.widthAnchor.constraint(equalToConstant: 22)
 width.isActive = true
 let height = barItem.customView?.heightAnchor.constraint(equalToConstant: 22)
 height.isActive = true

 */

