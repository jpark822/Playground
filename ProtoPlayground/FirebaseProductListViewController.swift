//
//  FirebaseProductListViewController.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Firebase

class FirebaseProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let itemCellReuseId = "itemCellReuseId"
    
    var items = [FirebaseItem]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "FireBaseItemTableViewCell", bundle: nil), forCellReuseIdentifier: self.itemCellReuseId)

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.beginObservingRemoteDatabase()
    }
    
    private func beginObservingRemoteDatabase() {
        Database.database().reference(withPath: Router.userAddedItems.pathString).queryOrdered(byChild: "addedByUsername").observe(.value, with: { snapshot in
            var newItems: [FirebaseItem] = []
            
            for itemSnapshot in snapshot.children {
                let item = FirebaseItem(snapshot: itemSnapshot as! DataSnapshot)
                newItems.append(item)
            }
            
            self.items = newItems
        })
    }

    @IBAction func addItemPressed(_ sender: Any) {
        let alert = UIAlertController(title: "New Item", message: "Add an Item", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textField = alert.textFields?.first,
                let text = textField.text else {
                    return
            }

            let itemToBeAdded = FirebaseItem(name: text.lowercased(), addedByUsername: Auth.auth().currentUser!.email!)
            
            ServiceManager.sharedInstance.addUserItem(itemToBeAdded)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

//MARK: uitableview datasource and delegate
extension FirebaseProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "listCellReuseId"
        
        let item = self.items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.itemCellReuseId) as! FirebaseItemTableViewCell
        cell.primaryLabel.text = item.name
        cell.secondaryLabel.text = item.addedByUsername
        
        return cell
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
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
}
