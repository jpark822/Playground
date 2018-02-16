//
//  DragToDismissAnimator.swift
//  CustomAnimations
//
//  Created by Jay Park on 2/16/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class DragToDismissAnimator: NSObject {
    let animationDuration = 0.3
}

extension DragToDismissAnimator:UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                return
        }
        
        //think of the container view as the view where the animation occurs
        let containerView = transitionContext.containerView
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        let screenBounds = UIScreen.main.bounds
        let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)
        let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
        
        //perform the actual animations
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            fromVC.view.frame = finalFrame
        }, completion: { _ in
            //you must call this when finished with animations
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        
    }
}
