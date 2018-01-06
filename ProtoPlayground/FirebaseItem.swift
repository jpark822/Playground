//
//  FirebaseItem.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation
import Firebase

struct FirebaseItem: FirebaseConsumableModel {
    
    let snapshotKey:String
    var name:String
    var addedByUsername:String
    let databaseReference:DatabaseReference?
    
    //used when building local items with the intent of pushing it to firebase
    init(name:String, addedByUsername:String) {
        self.name = name
        self.addedByUsername = addedByUsername
        
        self.snapshotKey = ""
        self.databaseReference = nil
    }
    
    //used when parsing data from firebase
    init(snapshot: DataSnapshot) {
        snapshotKey = snapshot.key
        databaseReference = snapshot.ref
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        addedByUsername = snapshotValue["addedByUsername"] as! String
    }
    
    func toFirebaseConsumable() -> Any {
        return [
            "name": name,
            "addedByUsername": addedByUsername,
        ]
    }
}
