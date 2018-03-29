//
//  PlainDetailViewController.swift
//  PeekPopPreview
//
//  Created by Jay Park on 3/18/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Foundation

class PlainDetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    @IBAction func closePressed(sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        var actionItems:[UIPreviewActionItem] = []
        
        let shareAction = UIPreviewAction(title: "Share", style: UIPreviewActionStyle.default) { (action, controller) in
            print("Share Pressed")
        }
        
        let deleteAction = UIPreviewAction(title: "Delete", style: UIPreviewActionStyle.destructive) { (action, controller) in
            print("Delete Pressed")
        }
        
        actionItems.append(shareAction)
        actionItems.append(deleteAction)
        
        return actionItems
    }

}
