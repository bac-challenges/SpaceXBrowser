//
//  AppDelegate.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UIWindowInjected, AppCoordinatorInjected {

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        appCoordinator.start()
        window.makeKeyAndVisible()
        
        return true
    }
}

