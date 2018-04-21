//
//  SelectRecipientViewController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/9/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class SelectRecipientViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    //Tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "Myself"
        default:
            cell?.textLabel?.text = "Friend/Coworker/Employee/Other"
        }
        
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    
    @IBAction func nextPressed(sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "selfSegue", sender: nil)
    }

}
