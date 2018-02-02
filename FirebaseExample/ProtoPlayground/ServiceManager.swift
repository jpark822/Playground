//
//  ServiceManager.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Firebase

class ServiceManager: NSObject {
    static let sharedInstance = ServiceManager()
    
    override init() {
        super.init()
    }
}

//Items
extension ServiceManager {
    func addUserItem(_ item:FirebaseItem) {
        let firebaseItemListReference = Database.database().reference(withPath: Router.userAddedItems.pathString)
        
        let databaseItemRef = firebaseItemListReference.child(item.name)
        
        databaseItemRef.setValue(item.toFirebaseConsumable())
    }
    
}

//Favorites
extension ServiceManager {
    func addFavoriteItem(_ item: FirebaseItem) {
        let firebaseItemListReference = Database.database().reference(withPath: Router.userFavorites.pathString)
        
        firebaseItemListReference.updateChildValues([item.name : item.guid])
    }
}
