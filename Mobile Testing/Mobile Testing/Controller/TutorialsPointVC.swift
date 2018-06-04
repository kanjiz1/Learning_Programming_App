//
//  TutorialsPointVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/5/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import WebKit
class TutorialsPointVC: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        navigationController?.navigationBar.topItem?.title = "Tutorials Point!"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        menuButton.customView?.snp.makeConstraints({ (make) in
            make.width.equalTo(10)
            make.height.equalTo(10)
        })
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        let url = URL(string: "https://www.tutorialspoint.com")
        webView.load(URLRequest(url: url!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }

}
