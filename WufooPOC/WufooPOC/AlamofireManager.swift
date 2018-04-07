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
class AlamofireManager: NSObject {
    fileprivate static let wufooAPIKey = "NNAU-AZAS-13TW-IRUX:welcometotgk12345!"
    
    static let sharedInstace = AlamofireManager()
    
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
    
    
    
    func getFormAlamofire() {
        self.sessionManager.request("https://jparksps.wufoo.com.wufoo.com/api/v3/forms/z1dxnntq1ft2smg/fields.json", headers: ["Authorization":"Basic \(AlamofireManager.wufooAPIKey.base64String)"]).responseJSON { (response) in
            print(response)
        }
    }
}


