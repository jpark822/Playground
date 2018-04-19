//
//  FirebaseTabBarController.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class FirebaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceManager.sharedInstance.getItemsAPI()
    }

}
