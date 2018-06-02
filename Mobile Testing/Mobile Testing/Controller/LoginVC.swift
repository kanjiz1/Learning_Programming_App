//
//  LoginVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/2/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT , sender: nil)
    }
    
}
