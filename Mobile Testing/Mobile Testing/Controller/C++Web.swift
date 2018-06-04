//
//  C++Web.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/5/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import WebKit

class C__Web: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.tutorialspoint.com/cplusplus/index.htm")
        webView.load(URLRequest(url: url!))
    }
    
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss()
    }
    
}
