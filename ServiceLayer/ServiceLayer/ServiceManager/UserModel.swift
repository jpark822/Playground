//
//  UserModel.swift
//  ServiceLayer
//
//  Created by Jay Park on 1/31/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

struct UserModel {
    var firstName:String
    var lastName:String
    
    init(firstName:String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
