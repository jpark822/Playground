//
//  DragDismissInteractor.swift
//  CustomAnimations
//
//  Created by Jay Park on 2/16/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class DragDismissInteractor: UIPercentDrivenInteractiveTransition {
    //percent you need to clear before the animation rolls back
    var percentThreshold:CGFloat = 0.3
    
    var hasStarted = false
    var shouldFinish = false
    
    var wiredView:UIView?
    var wiredViewController:UIViewController?
    
    func wirePanGestureRecognizerTo(view: UIView, inViewController:UIViewController) {
        let panGestureRec = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(sender:)))
        view.addGestureRecognizer(panGestureRec)
        
        self.wiredView = view
        self.wiredViewController = inViewController
    }
    
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
        
        // convert y-position to downward pull progress (percentage)
        guard let view = self.wiredView,
            let viewController = self.wiredViewController else {
            return
        }
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        //call update, cancel, or finish based on a calculated value
        switch sender.state {
        case .began:
            self.hasStarted = true
            viewController.dismiss(animated: true, completion: nil)
        case .changed:
            self.shouldFinish = progress > percentThreshold
            self.update(progress)
        case .cancelled:
            self.hasStarted = false
            self.cancel()
        case .ended:
            self.hasStarted = false
            self.shouldFinish ? self.finish() : self.cancel()
            if self.shouldFinish {
                //cleanup references
                self.wiredViewController = nil
                self.wiredView = nil
            }
        default:
            break
        }
    }
}
