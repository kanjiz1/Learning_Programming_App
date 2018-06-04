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
    var profilename: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self
        email.tag = 0
        password.delegate = self
        password.tag = 1
        self.hideKeyboardWhenTapped()
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: TO_CREATE_ACCOUNT) as? CreateAccountVC {
            self.present(presentedViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let email = email.text , let password = password.text else {
            AlertController.showAlert(self, title: "Missing info", message: "Fill out all fields")
            return
        }
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    print(error!.localizedDescription)
                    return
                }
                
                guard let user = user else{
                    return
                }
                print(user.user.email ?? "Missing Email")
                print(user.user.uid)
                print(user.user.displayName ?? "Missing Display Name")
                self.profilename = user.user.displayName
                print("Signed in Successfully")
                
                DispatchQueue.main.async {
                    UserDefaults.standard.set(Auth.auth().currentUser!.uid, forKey: "uid")
                    UserDefaults.standard.synchronize()
                }
            }
        dismiss(animated: true, completion: nil)
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
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissingKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissingKeyboard() {
        view.endEditing(true)
    }
}
