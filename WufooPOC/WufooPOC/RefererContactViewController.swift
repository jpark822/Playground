//
//  RefererContactViewController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/9/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class RefererContactViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var numberTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameTextField.delegate = self
        self.numberTextField.delegate = self
        self.emailTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.nameTextField.becomeFirstResponder()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "tellUsMoreSegue", sender: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.nameTextField:
            self.numberTextField.becomeFirstResponder()
            break
        case self.numberTextField:
            self.emailTextField.becomeFirstResponder()
            break
        case self.emailTextField:
            self.performSegue(withIdentifier: "tellUsMoreSegue", sender: nil)
            break
            
        default:
            break
        }
        
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField == self.numberTextField else {
            return true
        }
        
        if string == "" || string == " " {
            return true
        }
        let fullString = textField.text! + string
        if fullString.count > 15 {
            return false
        }
        textField.text = fullString.formatStringToPhoneNumber()
        return false
    }

}
