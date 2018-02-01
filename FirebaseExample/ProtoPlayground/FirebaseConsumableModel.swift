//
//  FirebaseConsumableModel.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation

protocol FirebaseConsumableModel {
    var guid:String { get }
    
    func toFirebaseConsumable() -> Any
}
