//
//  ViewController.swift
//  UnwindSegue
//
//  Created by Jay Park on 2/10/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToFirstVC(_ segue: UIStoryboardSegue) {
        print("unwinding to 1")
    }

}

