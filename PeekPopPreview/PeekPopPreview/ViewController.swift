//
//  ViewController.swift
//  PeekPopPreview
//
//  Created by Jay Park on 3/18/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func customPressed(sender: UIButton) {
        
    }
    
    @IBAction func plainPressed(sender: UIButton) {
        if let plainVC = UIStoryboard(name: "Plain", bundle: nil).instantiateInitialViewController() {
            self.present(plainVC, animated: true)
        }
    }

}

