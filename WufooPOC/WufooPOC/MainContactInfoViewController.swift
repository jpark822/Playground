//
//  MainContactInfoViewController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/10/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class MainContactInfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var countyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countyPicker.delegate = self
        self.countyPicker.dataSource = self
        self.countyPicker.selectRow(3, inComponent: 0, animated: false)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        self.zipTextField.delegate = self
        
        self.nameTextField.delegate = self
        self.numberTextField.delegate = self
        self.emailTextField.delegate = self
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Georgia County \(row)"
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.zipTextField {
            UIView.animate(withDuration: 0.3, animations: {
                if self.view.frame.origin.y < 100 {
                    self.view.frame.origin.y -= 200
                }
            })
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == self.zipTextField {
            UIView.animate(withDuration: 0.3, animations: {
                if self.view.frame.origin.y != 0 {
                    self.view.frame.origin.y += 200
                }
            })
        }
        return true
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
            self.zipTextField.becomeFirstResponder()
            break
        case self.zipTextField:
            self.zipTextField.resignFirstResponder()
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
    
    @IBAction func nextPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "restaurantSegue", sender: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
}
