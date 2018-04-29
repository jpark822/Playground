//
//  ViewController.swift
//  SwiftViewLoading
//
//  Created by Jay Park on 4/29/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let myView = MyLoadedView(frame: CGRect(x: 0, y: self.view.frame.size.height - 400, width: self.view.frame.size.width, height: 400))
        myView.changeLabels(text1: "some text", text2: "some other text")
        self.view.addSubview(myView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

