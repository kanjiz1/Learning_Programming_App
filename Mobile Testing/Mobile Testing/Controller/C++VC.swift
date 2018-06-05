//
//  C++VC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/5/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class C__VC: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        navigationController?.navigationBar.topItem?.title = "C++!"
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
    
    @IBAction func learnCodePressed(_ sender: Any) {
        if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "Cplus") as? C__Web {
            self.present(presentedViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func testYourKnowledgePressed(_ sender: Any) {
        if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "CplusTest") as? C__TestVC {
            self.present(presentedViewController, animated: true, completion: nil)
        }
    }
}
