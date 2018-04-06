//
//  ServiceManager.swift
//  WufooPOC
//
//  Created by Jay Park on 4/5/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Foundation

enum ServiceManagerResult<T, Error:Swift.Error> {
    case success(T)
    case failure(Error)
}

class ServiceManager: NSObject {

    static let sharedInstance = ServiceManager()
    fileprivate var sharedSession:URLSession!
    
    override init() {
        super.init()
        self.sharedSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
    }
    
    func dataTaskSerialized(with request:URLRequest, completion:@escaping (Any?, Error?)->Void) -> URLSessionDataTask {
        return self.sharedSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, nil)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                completion(nil, nil)
                return
            }
            
            completion(json, nil)
        }
    }
}

extension ServiceManager:URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodClientCertificate) {
            completionHandler(.rejectProtectionSpace, nil)
        }
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.useCredential, credential)
        }
    }
}


