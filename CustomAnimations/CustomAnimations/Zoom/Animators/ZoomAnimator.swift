//
//  ZoomAnimator.swift
//  CustomAnimations
//
//  Created by Jay Park on 2/24/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class ZoomAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting:Bool
    var originFrame:CGRect
    
    let animationDuration = 0.3
    
    override init() {
        self.isPresenting = true
        self.originFrame = CGRect.zero
        super.init()
    }
    
    convenience init(originFrame:CGRect, isPresenting:Bool) {
        self.init()
        self.isPresenting = isPresenting
        self.originFrame = originFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        //grab the view controller that will be presented
        let toView = transitionContext.view(forKey: .to)!
        let fromView = isPresenting ? toView : transitionContext.view(forKey: .from)!
        
        let initialFrame = self.isPresenting ? self.originFrame : fromView.frame
        let finalFrame = self.isPresenting ? fromView.frame : self.originFrame
        
        let xScaleFactor = self.isPresenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        
        let yScaleFactor = self.isPresenting ? (initialFrame.height / finalFrame.height) : (finalFrame.height / initialFrame.height)
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        if isPresenting {
            fromView.transform = scaleTransform
            fromView.center = CGPoint( x: initialFrame.midX, y: initialFrame.midY)
            fromView.clipsToBounds = true
        }
        
        //you must add the toView during this method. the fromView is removed automatically
        containerView.addSubview(toView)
        containerView.bringSubview(toFront: fromView)
        
        //animate the actual transition
        UIView.animate(withDuration: self.animationDuration, delay: 0.0, options: [.curveEaseOut], animations: {
            fromView.transform = self.isPresenting ? CGAffineTransform.identity : scaleTransform
            fromView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }) { _ in
            transitionContext.completeTransition(true)
        }
    }
}


/*
        alternatively use a spring bouncing option in place of the animation block above
        UIView.animate(withDuration: self.animationDuration, delay:0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, animations: {
            fromView.transform = self.isPresenting ? CGAffineTransform.identity : scaleTransform
            fromView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
 */

