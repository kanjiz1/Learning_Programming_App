//
//  LoginVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/2/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        username.tag = 0
        password.delegate = self
        password.tag = 1
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        print("Pressed")
        if let email = username.text , let password = password.text {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if let fireBaseError = error {
                    print(fireBaseError.localizedDescription)
                    return
                }
                print("Created Account Successfully")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let email = username.text , let password = password.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let fireBaseError = error {
                    print(fireBaseError.localizedDescription)
                    return
                }
                print("Signed in Successfully")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
