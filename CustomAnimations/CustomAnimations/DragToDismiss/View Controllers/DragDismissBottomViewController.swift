//
//  DragDismissBaseViewController.swift
//  CustomAnimations
//
//  Created by Jay Park on 2/16/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation
import UIKit

class DragDismissBottomViewController:UIViewController {
    let dismissAnimator = DragToDismissAnimator()
    let dragDismissInteractor = DragDismissInteractor()
    
    @IBAction func presentTopViewController(_ sender: Any) {
        if let topViewController = UIStoryboard(name: "DragDismiss", bundle: nil).instantiateViewController(withIdentifier: "DragDismissTopViewControllerId") as? DragDismissTopViewController {
            
            //set for dragging dismissal
            topViewController.transitioningDelegate = self
            self.present(topViewController)
            self.dragDismissInteractor.wirePanGestureRecognizerTo(view: topViewController.view, inViewController: topViewController)
        }
    }
}

extension DragDismissBottomViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.dismissAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.dragDismissInteractor.hasStarted ? self.dragDismissInteractor : nil
    }
}
