//
//  ViewController.swift
//  CustomAnimations
//
//  Created by Jay Park on 2/16/18.
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

    @IBAction func dragToDismiss(_ sender: Any) {
        if let initialVC = UIStoryboard(name: "DragDismiss", bundle: nil).instantiateInitialViewController() {
            self.present(initialVC, animated: true)
        }
    }
    
    @IBAction func zoom(_ sender: Any) {
        if let initialVC = UIStoryboard(name: "Zoom", bundle: nil).instantiateInitialViewController() {
            self.present(initialVC, animated: true)
        }
    }
}

