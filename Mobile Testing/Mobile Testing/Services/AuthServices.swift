//
//  AuthServices.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/4/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Firebase
import UIKit

class AuthService: UIViewController {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToke: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(username: String, email: String, password: String){
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
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else{
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
            })
        }
    }
}
