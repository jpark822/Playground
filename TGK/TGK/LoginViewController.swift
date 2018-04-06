//
//  LoginViewController.swift
//  TGK
//
//  Created by Jay Park on 4/3/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.styleView()
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive(notification:)), name: NSNotification.Name.UIApplicationWillResignActive, object: UIApplication.shared)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground(notification:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: UIApplication.shared)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideInputViews()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.showInputViews()
    }
    
    @objc func applicationWillResignActive(notification: NSNotification) {
        self.hideInputViews()
    }
    
    @objc func applicationWillEnterForeground(notification: NSNotification) {
        self.showInputViews()
    }
    
    
    func styleView() {
        self.loginButton.layer.borderWidth = 2
        self.signupButton.layer.borderWidth = 2
        self.continueButton.layer.borderWidth = 2
        
        self.loginButton.layer.borderColor = UIColor.tgkRed.cgColor
        self.signupButton.layer.borderColor = UIColor.tgkRed.cgColor
        self.continueButton.layer.borderColor = UIColor.tgkBlue.cgColor
        
        self.usernameTextField.layer.borderWidth = 1
        self.passwordTextField.layer.borderWidth = 1
        self.usernameTextField.layer.borderColor = UIColor.tgkBlue.cgColor
        self.passwordTextField.layer.borderColor = UIColor.tgkBlue.cgColor
    }
    
    func hideInputViews() {
        self.logoImageView.alpha = 0
        self.usernameTextField.alpha = 0
        self.passwordTextField.alpha = 0
        self.loginButton.alpha = 0
        self.signupButton.alpha = 0
        self.continueButton.alpha = 0
    }
    
    func showInputViews() {
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: {
            self.logoImageView.alpha = 1
        }) { (finished) in
        }
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.2, options: [], animations: {
            self.usernameTextField.alpha = 1
        }) { (finished) in
        }
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.4, options: [], animations: {
            self.passwordTextField.alpha = 1
        }) { (finished) in
        }
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.6, options: [], animations: {
            self.loginButton.alpha = 1
        }) { (finished) in
        }
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.8, options: [], animations: {
            self.signupButton.alpha = 1
        }) { (finished) in
        }
        UIView.animateKeyframes(withDuration: 1.0, delay: 1.0, options: [], animations: {
            self.continueButton.alpha = 1
        }) { (finished) in
        }
    }

}

//Unwind segue
extension LoginViewController {
    @IBAction func unwindToLogin(segue:UIStoryboardSegue) {
        
    }
    
}
