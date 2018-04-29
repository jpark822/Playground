//
//  RequestViewController.swift
//  TGK
//
//  Created by Jay Park on 4/3/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Foundation

class RequestViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var aboutCrisisTextField: UITextView!
    
    var activeInputView:UIView?
    
    var isPresentingKeyboard = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Assitance Inquiry"
        self.aboutCrisisTextField.layer.borderWidth = 1
        self.aboutCrisisTextField.layer.borderColor = UIColor.black.cgColor
        
        self.nameTextField.autocorrectionType = .no
        self.emailTextField.autocorrectionType = .no
        self.phoneTextField.autocorrectionType = .no
        
        self.nameTextField.delegate = self
        self.emailTextField.delegate = self
        self.phoneTextField.delegate = self
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(gesture:)))
        self.view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc func dismissKeyboard(gesture:UIGestureRecognizer) {
        self.view.endEditing(true)
    }

}

extension RequestViewController:UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.activeInputView = textField
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameTextField {
            self.emailTextField.becomeFirstResponder()
        }
        else if textField == self.emailTextField {
            self.phoneTextField.becomeFirstResponder()
        }
        else if textField == self.phoneTextField {
            self.phoneTextField.resignFirstResponder()
        }
        
        return true
    }
}
