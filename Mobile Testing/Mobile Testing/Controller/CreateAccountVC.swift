//
//  CreateAccountVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/2/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND , sender: nil)
    }
    
}
