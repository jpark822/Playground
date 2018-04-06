//
//  Router.swift
//  ServiceLayer
//
//  Created by Jay Park on 1/31/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

enum Router {
    static let baseUrl = "www.mypage.com"
    
    case firstEndpoint
    case secondEndpoint
    case thirdEndpoint(String) //not sure if I like this pattern of injecting a dependency here. It's hard to tell 'string' should be
}

extension Router {
    var httpMethod:String {
        get {
            switch self {
            case .firstEndpoint:
                return "POST"
            case .secondEndpoint:
                return "GET"
            case .thirdEndpoint:
                return "GET"
            }
        }
    }
    
    var urlString:String {
        get {
            switch self {
            case .firstEndpoint:
                return "example/profile"
            case .secondEndpoint:
                return "example/settings"
            case .thirdEndpoint(let userId):
                return "example/profile/\(userId)"
            }
        }
    }
}




