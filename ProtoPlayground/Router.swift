//
//  Router.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation

enum Router {
    case userAddedItems
    case userSettings
    
    
    
    var pathString:String {
        get {
            switch self {
            case .userAddedItems:
                return "userAddeditems"
            case .userSettings:
                return "userSettings"
            }
        }
    }
}
