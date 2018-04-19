//
//  AlamofireManager.swift
//  WufooPOC
//
//  Created by Jay Park on 4/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation
import Alamofire

//could rename to serivcemanager or networkmanager
class NetworkManager: NSObject {
    fileprivate static let wufooAPIKey = "NNAU-AZAS-13TW-IRUX:welcometotgk12345!"
    
    static let sharedInstace = NetworkManager()
    
    var sessionManager = SessionManager(configuration: .default)
    var sessionDelegate: Alamofire.SessionDelegate!
    
    override init() {
        super.init()
        self.sessionDelegate = sessionManager.delegate
        self.sessionDelegate.sessionDidReceiveChallengeWithCompletion = { (session, challenge, completionHandler) in
            if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodClientCertificate) {
                completionHandler(.rejectProtectionSpace, nil)
            }
            if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
                let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                completionHandler(.useCredential, credential)
            }
        }
    }
    
    func getFormAlamofire(completion:@escaping ([FormQuestionModel]?, Error?)->Void) {
        self.sessionManager.request("https://jparksps.wufoo.com.wufoo.com/api/v3/forms/z1dxnntq1ft2smg/fields.json", headers: ["Authorization":"Basic \(NetworkManager.wufooAPIKey.base64String)"]).responseJSON { (response) in
            print(response)
            
            if let error = response.result.error {
                completion(nil, error)
            }
            
            guard let topLevelJsonDict = response.result.value as? [String:Any],
            let jsonArray = topLevelJsonDict["Fields"] as? [[String:Any]] else {
                completion(nil, nil)
                return
            }

            let filteredArray = jsonArray.filter({ (dict) -> Bool in
                //filtering out noise using a common question attribute. fragile
                return dict["IsRequired"] != nil ? true : false
            })
            
            var parsedModels = [FormQuestionModel]()
            for jsonDict in filteredArray {
                parsedModels.append(FormQuestionModel(jsonDict: jsonDict))
            }
            completion(parsedModels, nil)
        }
    }
    
    func submitAnswers(_ answerDict:[String:String], completion:@escaping (Bool, Error?)->Void) {
        self.sessionManager.request("https://jparksps.wufoo.com/api/v3/forms/z1dxnntq1ft2smg/entries.json", method: .post, parameters: answerDict, encoding: URLEncoding.default, headers: ["Authorization":"Basic \(NetworkManager.wufooAPIKey.base64String)"]).responseJSON { (response) in
            print(response)
            if let error = response.result.error {
                completion(false, error)
            }
            else {
                completion(true, nil)
            }
        }
    }
    
    func getSegmentedForm(completion: @escaping (SegmentedFormModel?, Error?)->Void) {
        
        if let path = Bundle.main.path(forResource: "segmentedForm", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
                let segmentedForm = SegmentedFormModel(jsonDict: jsonObj)
                completion(segmentedForm, nil)
                
            }
            catch let error {
                print("parse error: \(error.localizedDescription)")
                completion(nil, nil)
            }
        }
        else {
            print("Invalid filename/path.")
            completion(nil, nil)
        }

        
    }
}


