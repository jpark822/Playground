//
//  ServiceManager.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/6/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

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
    
    func getItemsAPI() {
        Alamofire.request("https://playground-38984.firebaseio.com/userAddeditems.json", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            print(response)
        }
        
    }
    
}

//Favorites
extension ServiceManager {
    func addFavoriteItem(_ item: FirebaseItem) {
        let firebaseItemListReference = Database.database().reference(withPath: Router.userFavorites.pathString)
        
        firebaseItemListReference.updateChildValues([item.name : item.guid])
    }
}
