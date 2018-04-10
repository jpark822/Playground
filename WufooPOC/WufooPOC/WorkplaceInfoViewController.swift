//
//  WorkplaceInfoViewController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/9/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class WorkplaceInfoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.becomeFirstResponder()
        self.textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.performSegue(withIdentifier: "hardshipTypeSegue", sender: nil)
        return false
    }

    @IBAction func nextPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "hardshipTypeSegue", sender: nil)
    }
    
}
