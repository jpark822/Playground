//
//  DragDismissTopViewController.swift
//  CustomAnimations
//
//  Created by Jay Park on 2/16/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation
import UIKit

class DragDismissTopViewController:UIViewController {
    
    var dragDismissInteractor:DragDismissInteractor?
    
    override func viewDidLoad() {
        //setup a pan gesture recognizer for drag dismissal
        self.setupPanGestureRecogznier()
    }
    
    func setupPanGestureRecogznier() {
        let panGestureRec = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(sender:)))
        self.view.addGestureRecognizer(panGestureRec)
    }
    
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
        //percent you need to clear before the animation rolls back
        let percentThreshold:CGFloat = 0.3
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        guard let interactor = self.dragDismissInteractor else {
            return
        }
        
        switch sender.state {
            case .began:
                interactor.hasStarted = true
                self.dismiss(animated: true, completion: nil)
            case .changed:
                interactor.shouldFinish = progress > percentThreshold
                interactor.update(progress)
            case .cancelled:
                interactor.hasStarted = false
                interactor.cancel()
            case .ended:
                interactor.hasStarted = false
                interactor.shouldFinish ? interactor.finish() : interactor.cancel()
            default:
                break
        }
    }
}
