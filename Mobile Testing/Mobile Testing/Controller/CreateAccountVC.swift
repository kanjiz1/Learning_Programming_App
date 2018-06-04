//
//  CreateAccountVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/2/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var profileName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        email.delegate = self
        password.delegate = self
        
        username.tag = 0
        email.tag = 1
        password.tag = 2
        hideKeyboardWhenTapped()
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND , sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = email.text , let password = password.text else {
            AlertController.showAlert(self, title: "Missing info", message: "Fill out all fields")
            return
        }
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
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
                let changeRequest = user.user.createProfileChangeRequest()
                changeRequest.displayName = self.username.text
                changeRequest.commitChanges(completion: { (error) in
                    guard error == nil else{
                        AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                        return
                    }
                    print("Created Account Successfully")
                    self.profileName = user.user.displayName
                })
            }
        
        DispatchQueue.main.async {
            UserDefaults.standard.set(Auth.auth().currentUser!.uid, forKey: "uid")
            UserDefaults.standard.synchronize()
        }
        
        self.performSegue(withIdentifier: UNWIND , sender: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

