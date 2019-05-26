//
//  AppearanceInitializer.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class AppearanceInitializer: Initializable {
    
    func initialize() {
        // UITabBar
        UITabBar.appearance().tintColor = UIColor.coolGreen
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().shadowImage = UIImage.imageWithColor(color: .lightGreyish)
        UITabBar.appearance().backgroundImage = UIImage.imageWithColor(color: .white)
        UITabBar.appearance().isTranslucent = false
        
        // Navigation bar
        UINavigationBar.appearance().tintColor = UIColor.gray
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().setBackgroundImage(UIImage.imageWithColor(color: .white), for: .default)
        UINavigationBar.appearance().isTranslucent = false
        
        let font = UIFont.systemFont(ofSize: 17)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: font]
    }
}

