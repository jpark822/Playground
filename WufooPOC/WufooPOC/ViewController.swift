//
//  ViewController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/4/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class ViewController: UIViewController {

    let APIKey = "NNAU-AZAS-13TW-IRUX:welcometotgk12345!"
    var utfApiKey:Data {
        return APIKey.data(using: .utf8)!
    }
    var base64String:String {
        return utfApiKey.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        postFormEntryAlamofire()
        
    }

    func getAllForms() {
        var formRequest = URLRequest(url: URL(string:"https://jparksps.wufoo.com/api/v3/forms.json")!)
        formRequest.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let formTask = ServiceManager.sharedInstance.dataTaskSerialized(with: formRequest) { (response, error) in
            print(response)
            print(error)
        }
        formTask.resume()
    }
    
    func getForm() {
        var formRequest = URLRequest(url: URL(string:"https://jparksps.wufoo.com.wufoo.com/api/v3/forms/z1dxnntq1ft2smg/fields.json")!)
        formRequest.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let formTask = ServiceManager.sharedInstance.dataTaskSerialized(with: formRequest) { (response, error) in
            print(response)
            print(error)
        }
        formTask.resume()
    }
    
    func postFormEntry() {
        var formRequest = URLRequest(url: URL(string:"https://jparksps.wufoo.com/api/v3/forms/z1dxnntq1ft2smg/entries.json")!)
        formRequest.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        formRequest.httpMethod = "POST"
        formRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        
        let jsonString = "Field2=Should be a name&Field3=1234567890&Field6=two&Field7=four"
        let formData = jsonString.data(using: .utf8)
        formRequest.httpBody = formData
        
        let formTask = ServiceManager.sharedInstance.dataTaskSerialized(with: formRequest) { (response, error) in
            print(response)
            print(error)
        }
        formTask.resume()
    }
    
    func postFormEntryAlamofire() {
        let params = ["Field2":"Totes",
                      "Field3":"1234567890",
                      "Field6":"two",
                      "Field7":"four"]
        Alamofire.request("https://jparksps.wufoo.com/api/v3/forms/z1dxnntq1ft2smg/entries.json", method: .post, parameters: params, encoding: URLEncoding.default, headers: ["Authorization":"Basic \(base64String)"]).responseJSON { (response) in
            print(response)
        }
    }
    
    func getFormAlamofire() {
        
        Alamofire.request("https://jparksps.wufoo.com/api/v3/forms/z1dxnntq1ft2smg/entries.json", headers: ["Authorization":"Basic \(base64String)"]).responseJSON { (response) in
            print(response)
        }
    }
    
    
}

