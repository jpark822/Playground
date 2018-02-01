//
//  ServiceManager.swift
//  ServiceLayer
//
//  Created by Jay Park on 1/31/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {
    let sharedSession:URLSession
    static var sharedInstance = ServiceManager()
    
    override init() {
        self.sharedSession = URLSession(configuration: URLSessionConfiguration.default)
        
        super.init()
    }
    
    
}


//Mark: Grouping endpoints by extension. In this example, things relating to user settings
extension ServiceManager {
    func getSettingsForCurrentUser(completion:@escaping (ServiceManagerResult<UserModel, NSError>) -> Void) {
        self.sharedSession.dataTask(with: URL(string: Router.firstEndpoint.urlString)!) { (data, response, error) in
            //serialize and parse
            if error == nil {
                let userModel = UserModel(firstName: "Tom", lastName: "Haverford")
                let result = ServiceManagerResult<UserModel, NSError>.success(userModel)
                completion(result)
            }
            else {
                //just an error example. most likely should be conforming to Swift.Error more explicitly. Or pass down something like alamofire's error
                let error = NSError(domain: "myMadeUpErrorCodeDomain", code: 999, userInfo: [NSLocalizedFailureReasonErrorKey:"Domain Failure",
                                                                                             NSLocalizedDescriptionKey: "Something failed, Please try again"])
                let result = ServiceManagerResult<UserModel, NSError>.failure(error)
                completion(result)
            }
        }
    }
    
    func getSettingsForAllUsers(completion: @escaping (ServiceManagerResult<[UserModel], NSError>) -> Void) {
        self.sharedSession.dataTask(with: URL(string: Router.firstEndpoint.urlString)!) { (data, response, error) in
            //serialize and parse
            if error == nil {
                let userModels = [UserModel(firstName: "Tom", lastName: "Haverford"), UserModel(firstName:"Ron", lastName:"Swanson")]
                let result = ServiceManagerResult<[UserModel], NSError>.success(userModels)
                completion(result)
            }
            else {
                //just an error example. most likely should be conforming to Swift.Error more explicitly. Or pass down something like alamofire's error
                let error = NSError(domain: "myMadeUpErrorCodeDomain", code: 999, userInfo: [NSLocalizedFailureReasonErrorKey:"Domain Failure",
                                                                                             NSLocalizedDescriptionKey: "Something failed, Please try again"])
                let result = ServiceManagerResult<[UserModel], NSError>.failure(error)
                completion(result)
            }
        }
    }
}
