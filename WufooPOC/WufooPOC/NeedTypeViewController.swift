//
//  NeeTypeViewController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/9/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class NeedTypeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    //Tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "Injury"
        case 1:
            cell?.textLabel?.text = "Illness"
        case 2:
            cell?.textLabel?.text = "Funeral/Death (Immediate Family)"
        case 3:
            cell?.textLabel?.text = "Disaster (Flood, fire, storm damage, etc.)"
        case 4:
            cell?.textLabel?.text = "Other"
        default:
            break
        }
        
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "referrerSegue", sender: nil)
    }

}
