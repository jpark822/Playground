//
//  MainTabBarController.swift
//  TGK
//
//  Created by Jay Park on 4/3/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let viewControllers = self.viewControllers {
            for childController in viewControllers {
                _ = childController.view
            }
        }
    }


}
