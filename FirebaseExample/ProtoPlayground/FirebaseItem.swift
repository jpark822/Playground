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
    
    let guid: String
    let snapshotKey: String
    let databaseReference:DatabaseReference?
    
    let name: String
    let addedByUsername: String
    
    
    //used when building local items with the intent of pushing it to firebase
    init(name: String, addedByUsername: String) {
        self.guid = String(arc4random_uniform(999999))
        self.snapshotKey = ""
        self.databaseReference = nil
        
        self.name = name
        self.addedByUsername = addedByUsername
    }
    
    //used when parsing data from firebase
    init(snapshot: DataSnapshot) {
        snapshotKey = snapshot.key
        databaseReference = snapshot.ref
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.name = snapshotValue["name"] as! String
        self.addedByUsername = snapshotValue["addedByUsername"] as! String
        self.guid = snapshotValue["guid"] as! String
    }
    
    func toFirebaseConsumable() -> Any {
        return [
            "name": self.name,
            "addedByUsername": self.addedByUsername,
            "guid" : self.guid
        ]
    }
}
