//
//  FirebaseFavoriteItemModel.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation
import Firebase

struct FirebaseFavoriteItem:FirebaseConsumableModel {
    let guid: String
    let snapshotKey: String
    let databaseReference:DatabaseReference?
    
    let favoriteReferenceGuid: String
    
    init(item:FirebaseConsumableModel) {
        self.guid = UUID().uuidString
        self.snapshotKey = ""
        self.databaseReference = nil
        
        self.favoriteReferenceGuid = item.guid
    }
    
    func toFirebaseConsumable() -> Any {
        return [
            "favoriteReferenceGuid" : self.favoriteReferenceGuid,
            "guid" : self.guid
        ]
    }
}
