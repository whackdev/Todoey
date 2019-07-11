//
//  AppDelegate.swift
//  Todoey
//
//  Created by Nicholas F Forlivio, Sr. on 7/5/19.
//  Copyright © 2019 WhacKdev. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        do {
            _ = try Realm()
            
        } catch {
            print("realm error \(error)")
        }
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
  


}

