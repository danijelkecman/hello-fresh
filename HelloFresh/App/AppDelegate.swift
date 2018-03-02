//
//  AppDelegate.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import CoreData
import SwiftyBeaver

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Initializations
        _initializeDependencies(LoggerInitializer(),
                                AppearanceInitializer())
        
        // Setup
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = _instantiateRootViewController()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: Private functions
    
    private func _initializeDependencies(_ dependencyInitializers: Initializable...) {
        for dependencyInitializer in dependencyInitializers {
            dependencyInitializer.initialize()
        }
    }
    
    private func _instantiateRootViewController() -> UIViewController {
        let navigationController = UINavigationController()
        
        let wireframe = OnboardWireframe(navigationController: navigationController)
        wireframe.show(with: .root)
        
        return navigationController
    }
}

