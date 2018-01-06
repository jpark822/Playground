//
//  HomeViewController.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/5/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func firebaseDemoPressed(_ sender: Any) {
        let firebaseDemoHome = UIStoryboard(name: "FirebaseDemo", bundle: nil).instantiateViewController(withIdentifier: "FirebaseLoginViewControllerId") as! FirebaseLoginViewController
        self.present(firebaseDemoHome, animated: true)
    }
}
