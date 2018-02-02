//
//  FirebaseItemTableViewCell.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

protocol FirebaseItemTableViewCellDelegate : NSObjectProtocol {
    func firebaseItemTableViewFavoriteTapped(cell: FirebaseItemTableViewCell)
}

class FirebaseItemTableViewCell: UITableViewCell {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    var indexPath:IndexPath?
    weak var delegate:FirebaseItemTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWithItem(_ item: FirebaseItem, indexPath:IndexPath) {
        self.primaryLabel.text = item.name
        self.secondaryLabel.text = item.addedByUsername
        
        self.indexPath = indexPath
    }
    
    @IBAction func favoritePressed(_ sender: Any) {
        self.delegate?.firebaseItemTableViewFavoriteTapped(cell: self)
    }
}
