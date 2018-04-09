//
//  FormTextFieldTableViewCell.swift
//  WufooPOC
//
//  Created by Jay Park on 4/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Foundation

class FormTextFieldTableViewCell: UITableViewCell, FormItemView {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    enum TextInputType {
        case unspecifiedText
        case email
        case phoneNumber
        case fullName
        case jobTitle
    }
    
    var formQuestion: FormQuestionModel! {
        didSet {
            self.configureView()
        }
    }
    var mainInputControl: UIView {
        return self.textField
    }
    var formItemOutputValue: String? {
        switch self.inputType {
        case .unspecifiedText:
            return self.textField.text
        case .email:
            return self.textField.text
        case .phoneNumber:
            return self.textField.text?.components(separatedBy: CharacterSet.decimalDigits.inverted)
                .joined()
        case .fullName:
            return self.textField.text
        case .jobTitle:
            return self.textField.text
        }
    }
    var inputType:TextInputType = .unspecifiedText {
        didSet {
            self.formatTextFieldBasedOnInputType()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
    }
    
    private func configureView() {
        self.questionLabel.text = self.formQuestion.questionName
        self.formatTextFieldBasedOnInputType()
    }
}

//validation and formatting
extension FormTextFieldTableViewCell: UITextFieldDelegate {
    func formatTextFieldBasedOnInputType() {
        switch self.inputType {
        case .unspecifiedText:
            self.textField.textContentType = UITextContentType("")
            self.textField.keyboardType = .default
            self.textField.autocapitalizationType = .sentences
            break
        case .email:
            self.textField.textContentType = UITextContentType.emailAddress
            self.textField.keyboardType = .emailAddress
            self.textField.autocapitalizationType = .none
            break
        case .phoneNumber:
            self.textField.textContentType = UITextContentType.telephoneNumber
            self.textField.keyboardType = .phonePad
            self.textField.autocapitalizationType = .none
            break
        case .fullName:
            self.textField.textContentType = UITextContentType.name
            self.textField.keyboardType = .asciiCapable
            self.textField.autocapitalizationType = .words
            break
        case .jobTitle:
            self.textField.textContentType = UITextContentType.jobTitle
            self.textField.keyboardType = .default
            self.textField.autocapitalizationType = .words
            break
        }
    }

    //textField delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch self.inputType {
        case .unspecifiedText:
            return true
        case .email:
            return true
        case .phoneNumber:
            if string == "" || string == " " {
                return true
            }
            let fullString = textField.text! + string
            if fullString.count > 15 {
                return false
            }
            textField.text = fullString.formatStringToPhoneNumber()
            return false
        case .fullName:
            return true
        case .jobTitle:
            return true
        }
    }
}
