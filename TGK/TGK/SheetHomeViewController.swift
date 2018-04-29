    //
//  SheetHomeViewController.swift
//  TGK
//
//  Created by Jay Park on 4/29/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class SheetHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentedTapped(_ sender: Any) {
        let viewcontroller = UIStoryboard(name: "SegmentedForm", bundle: nil).instantiateInitialViewController()
        self.present(viewcontroller!, animated: true)
    }
    
    @IBAction func hardcodedTapped(_ sender: Any) {
        let viewcontroller = UIStoryboard(name: "Hardcoded", bundle: nil).instantiateInitialViewController()
        self.present(viewcontroller!, animated: true)
    }
    
}
