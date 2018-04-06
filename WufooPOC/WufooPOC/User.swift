
//
//  User.swift
//  WufooPOC
//
//  Created by Jay Park on 4/5/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation

struct User {
    private enum keys:String {
        case name = "name"
        case number = "number"
    }
    
    var name:String
    var number:String
    
    init(dict:[String:String]) {
        self.name = dict[keys.name.rawValue]!
        self.number = dict[keys.number.rawValue]!
    }
}
