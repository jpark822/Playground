//
//  FirebaseFavoritesViewController.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class FirebaseFavoritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

//MARK: uitableview datasource and delegate
//extension FirebaseFavoritesViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let reuseID = "listCellReuseId"
//
//        let item = self.items[indexPath.row]
//
//        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID) {
//            cell.textLabel?.text = item.name
//            cell.detailTextLabel?.text = item.addedByUsername
//            return cell
//        }
//        else {
//            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseID)
//            cell.textLabel?.text = item.name
//            cell.detailTextLabel?.text = item.addedByUsername
//            return cell
//        }
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.items.count
//    }
//}

