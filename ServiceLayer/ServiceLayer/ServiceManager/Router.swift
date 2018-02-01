//
//  Router.swift
//  ServiceLayer
//
//  Created by Jay Park on 1/31/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

enum Router {
    case baseUrl
    case firstEndpoint
    case secondEndpoint
}

extension Router {
    var urlString:String {
        get {
            switch self {
            case .baseUrl:
                return "https://baseurl.com"
            case .firstEndpoint:
                return "example/profile"
            case .secondEndpoint:
                return "example/settings"
            }
        }
    }
}


