//
//  AppDelegate.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 06.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var rootController: UINavigationController {
        window?.rootViewController = UINavigationController()
        return window?.rootViewController as! UINavigationController
    }
    
    fileprivate lazy var coordinator: Coordinatable = self.makeCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        coordinator.start()
        return true
    }
}

// MARK:- Private methods
private extension AppDelegate {
    func makeCoordinator() -> Coordinatable {
        return AppCoordinator(router: Router(rootController: rootController),
                              factory: CoordinatorFactory())
    }
}
