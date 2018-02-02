//
//  FavoritesManager.swift
//  ProtoPlayground
//
//  Created by Jay Park on 1/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import Firebase

class FavoritesManager: NSObject {
    static let sharedInstance = FavoritesManager()
    let favoritesDidChangeNotification:Notification.Name = Notification.Name(rawValue: "favoritesDidChangeNotification")
    
    var favoritesGuids:[String] = []
    
    override init() {
        super.init()
        
        Database.database().reference(withPath: Router.userFavorites.pathString).observe(.value) { (snapshot) in
            print("New favorites \(self.favoritesGuids)")
            NotificationCenter.default.post(name: self.favoritesDidChangeNotification, object: nil)
        }
    }
}
