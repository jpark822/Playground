//
//  HelpOutViewController.swift
//  TGK
//
//  Created by Jay Park on 4/3/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class HelpOutViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    enum HelpSection:Int {
        case volunteer = 0
        case partner = 1
        case educate = 2
        case sponsor = 3
        case multiply = 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewWillAppear(animated)
    }

    @IBAction func alternateDonationPressed(_ sender: Any) {
        let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebKitViewControllerId") as! WebKitViewController
        webVC.urlString = "https://connect.clickandpledge.com/w/Form/d11bff52-0cd0-44d8-9403-465614e4f342"
        webVC.title = "Thank you!"
        self.navigationController?.pushViewController(webVC, animated: true)
    }
}


//MARK: UITableViewController datasource and delegate
extension HelpOutViewController:UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.font = UIFont(name: "Helvetica Neue", size: 24)
        cell?.textLabel?.textColor = UIColor.tgkRed
        
        switch indexPath.row {
        case HelpSection.volunteer.rawValue:
            cell?.textLabel?.text = "Volunteer"
            cell?.accessoryType = .disclosureIndicator
            break
        case HelpSection.partner.rawValue:
            cell?.textLabel?.text = "Partner"
            cell?.accessoryType = .disclosureIndicator
            break
        case HelpSection.educate.rawValue:
            cell?.textLabel?.text = "Educate"
            cell?.accessoryType = .detailDisclosureButton
            break
        case HelpSection.sponsor.rawValue:
            cell?.textLabel?.text = "Sponsor"
            cell?.accessoryType = .detailDisclosureButton
            break
        case HelpSection.multiply.rawValue:
            cell?.textLabel?.text = "Multiply Joy"
            cell?.accessoryType = .detailDisclosureButton
            break
        default:
            break
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.size.height / 5.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case HelpSection.volunteer.rawValue:
            let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebKitViewControllerId") as! WebKitViewController
            webVC.urlString = "https://thegivingkitchen.wufoo.com/forms/gk-volunteer-survey/"
            webVC.title = "Volunteer Sign Up"
            self.navigationController?.pushViewController(webVC, animated: true)
            break
        case HelpSection.partner.rawValue:
            let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebKitViewControllerId") as! WebKitViewController
            webVC.urlString = "https://thegivingkitchen.wufoo.com/forms/join-our-forces/"
            webVC.title = "Partnership Sign Up"
            self.navigationController?.pushViewController(webVC, animated: true)
            break
        case HelpSection.educate.rawValue:
            let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebKitViewControllerId") as! WebKitViewController
            webVC.urlString = "https://thegivingkitchen.org/educate-your-staff"
            webVC.title = "Education"
            self.navigationController?.pushViewController(webVC, animated: true)
                break
            case HelpSection.sponsor.rawValue:
                let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebKitViewControllerId") as! WebKitViewController
                webVC.urlString = "https://thegivingkitchen.wufoo.com/forms/join-our-forces/"
                webVC.title = "Sponsorship Sign Up"
                self.navigationController?.pushViewController(webVC, animated: true)
            break
        case HelpSection.multiply.rawValue:
            let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebKitViewControllerId") as! WebKitViewController
            webVC.urlString = "https://thegivingkitchen.wufoo.com/forms/multiply-joy-inquiry/"
            webVC.title = "Multiply Joy"
            self.navigationController?.pushViewController(webVC, animated: true)
            break
        default:
            break
        }
    }
}
