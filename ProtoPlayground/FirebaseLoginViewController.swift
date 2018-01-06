//
//  FirebaseLoginViewController.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/5/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FirebaseLoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextField.becomeFirstResponder()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let username = self.usernameTextField.text,
            let password = self.passwordTextField.text else {
                return
        }
        
        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            if let error = error {
                print(error)
            }
            else if error == nil && user != nil {
                let mainTabBarController = UIStoryboard(name: "FirebaseDemo", bundle: nil).instantiateViewController(withIdentifier: "FirebaseTabBarControllerId")
                self.present(mainTabBarController, animated: true)
            }
            else {
                print("something else is wrong")
            }
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        guard let username = self.usernameTextField.text,
            let password = self.passwordTextField.text else {
                return
        }
        
        Auth.auth().createUser(withEmail: username, password: password) { (user, error) in
            if let error = error {
                print(error)
            }
            else if error == nil && user != nil {
                
            }
            else {
                print("something else is wrong")
            }
        }
    }
    
    
}
