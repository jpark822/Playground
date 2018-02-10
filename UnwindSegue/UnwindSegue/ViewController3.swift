//
//  ViewController3.swift
//  UnwindSegue
//
//  Created by Jay Park on 2/10/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*  when you create an unwind segue method that conforms to:
    @IBAction func methodName(_ segue: UIStoryboardSegue)
     ALL OF THEM will show up when connect the outlet. make the signature distinct
 */
    @IBAction func unwindToThirdVC(_ segue: UIStoryboardSegue) {
        print("unwinding to 3")
    }

}
