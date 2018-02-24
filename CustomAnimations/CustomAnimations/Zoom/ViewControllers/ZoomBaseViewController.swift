//
//  ZoomBaseViewController.swift
//  CustomAnimations
//
//  Created by Jay Park on 2/23/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class ZoomBaseViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellReuseID = "zoomCellReuseID"
    
    var zoomAnimator:ZoomAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(ZoomCollectionViewCell.self, forCellWithReuseIdentifier: self.cellReuseID)

    }
}

extension ZoomBaseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellReuseID, for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), green: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), blue: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), alpha: 1.0)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cellAttributes = self.collectionView.layoutAttributesForItem(at: indexPath) else {
            return
        }
        let cellFrameInSuperview = self.collectionView.convert(cellAttributes.frame, to: self.view)
        
        self.zoomAnimator = ZoomAnimator(originFrame: cellFrameInSuperview, isPresenting: true)
        
        let topViewController = UIStoryboard(name: "Zoom", bundle: nil).instantiateViewController(withIdentifier: "ZoomTopViewControllerId")
        topViewController.view.backgroundColor = self.collectionView.cellForItem(at: indexPath)?.backgroundColor
        
        topViewController.transitioningDelegate = self
        self.present(topViewController, animated: true)
    }
}

extension ZoomBaseViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//transition
extension ZoomBaseViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return self.zoomAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.zoomAnimator.isPresenting = false
        return self.zoomAnimator
    }
}
