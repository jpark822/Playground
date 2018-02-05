//
//  AppDelegate.swift
//  ModernPushNotifications
//
//  Created by Jay Park on 2/4/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.requestPushNotificationAuthorization()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: - Push notifications
    func promptOrRemindForPushNotifications() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("settings \(settings)")
            
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestPushNotificationAuthorization()
                break
                
            case .authorized:
                //do nothing, we're good
                break
                
            case .denied:
                self.showReminderForSettings()
                break
            }
            
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    //show the 1 time user dialogue asking for permissions
    func requestPushNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("granted: \(granted)")

            if (granted) {
                self.registerForRemoteNotifications()
            }
            
            self.registerForRemoteNotifications()
        }
    }
    
    //register with remote server. called after user approves dialogue
    func registerForRemoteNotifications() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("settings \(settings)")
            
            guard settings.authorizationStatus == .authorized else {
                return
            }
            
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    //show alert UI reminder that deep links into settings. Could be any custom UI
    func showReminderForSettings() {
        let alertController = UIAlertController(title: "Sad Face Emoji!",
                                                message: "Please enable notifications in Settings to continue.",
                                                preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alertAction) in
            if let appSettings = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(appSettings, options: [:], completionHandler: { (success) in
                })
            }
        }
        alertController.addAction(settingsAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        //present from wherever you need to
        //presentViewController(alertController, animated: true, completion: nil)
    }

    //delegate methods
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //JIC you need the device token
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }

}

