//
//  PlainBottomViewController.swift
//  PeekPopPreview
//
//  Created by Jay Park on 3/18/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class PlainBottomViewController: UIViewController {

    @IBOutlet weak var sushiImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerForPreviewing(with: self, sourceView: self.sushiImageView)
    }

}

extension PlainBottomViewController:UIViewControllerPreviewingDelegate {
    

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print("previewing/peeking")
//        previewingContext.sourceRect = CGRect(origin: CGPoint(x: self.sushiImageView.frame.origin.x - 75.0, y: self.sushiImageView.frame.origin.y - 75.0), size: CGSize(width: 150.0, height: 150.0))
        let detailVC = UIStoryboard(name: "Plain", bundle: nil).instantiateViewController(withIdentifier: "PlainDetailViewControllerId") as! PlainDetailViewController
        _ = detailVC.view
        detailVC.detailImageView.image = self.sushiImageView.image
        return detailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        print("committing/popping")
        let detailVC = UIStoryboard(name: "Plain", bundle: nil).instantiateViewController(withIdentifier: "PlainDetailViewControllerId") as! PlainDetailViewController
        _ = detailVC.view
        detailVC.detailImageView.image = self.sushiImageView.image
        self.present(detailVC, animated: false)
    }
}
