//
//  Router.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation
import Firebase

enum Router {
    case userAddedItems
    case userSettings
    case userFavorites
    
    
    var pathString:String {
        get {
            switch self {
            case .userAddedItems:
                return "userAddeditems"
            case .userSettings:
                return "userSettings/\(Auth.auth().currentUser!.uid)"
            case .userFavorites:
                return "\(Router.userSettings.pathString)/favorites"
            }
            
        }
    }
}
