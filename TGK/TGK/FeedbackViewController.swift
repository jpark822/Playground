//
//  FeedbackViewController.swift
//  TGK
//
//  Created by Jay Park on 4/3/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.layer.borderColor = UIColor.tgkBlue.cgColor
        self.emailTextField.layer.borderWidth = 1
        self.commentsTextView.layer.borderColor = UIColor.tgkBlue.cgColor
        self.commentsTextView.layer.borderWidth = 1
        
        self.submitButton.layer.cornerRadius = 5
        self.submitButton.layer.borderColor = UIColor.tgkBlue.cgColor
        self.submitButton.layer.borderWidth = 2
        
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(gesture:)))
        self.view.addGestureRecognizer(dismissKeyboardTap)
    }

    @objc func dismissKeyboard(gesture:UIGestureRecognizer) {
        self.view.endEditing(true)
    }
}
