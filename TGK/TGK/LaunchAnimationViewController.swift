//
//  LaunchAnimationViewController.swift
//  TGK
//
//  Created by Jay Park on 5/1/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class LaunchAnimationViewController: UIViewController {

    @IBOutlet weak var logoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, delay: 0.6, options: [.curveEaseOut], animations: {
            let shrunkSize = __CGSizeApplyAffineTransform(self.logoView.frame.size, CGAffineTransform(scaleX: 0.75, y: 0.75))
            self.logoView.frame.size = shrunkSize
            self.logoView.center = self.view.center
        }) { (finished) in
            UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseIn], animations: {
                let blowUpSize = __CGSizeApplyAffineTransform(self.logoView.frame.size, CGAffineTransform(scaleX: 30.0, y: 30.0))
                self.logoView.frame.size = blowUpSize
                self.logoView.center = self.view.center
            }, completion: { (finished) in
                self.logoView.isHidden = true
                let mainTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarControllerId")
                self.present(mainTabBar, animated: false)
            })
        }
    }

}
