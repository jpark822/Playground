
//
//  MyLoadedView.swift
//  SwiftViewLoading
//
//  Created by Jay Park on 4/29/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class MyLoadedView: BaseNibLoadedView {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    func changeLabels(text1:String, text2:String) {
        label1.text = text1
        label2.text = text2
    }
}
