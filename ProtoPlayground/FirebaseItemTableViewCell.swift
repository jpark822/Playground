//
//  FirebaseItemTableViewCell.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class FirebaseItemTableViewCell: UITableViewCell {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
