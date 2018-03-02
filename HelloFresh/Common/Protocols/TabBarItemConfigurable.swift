//
//  TabBarItemConfigurable.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

protocol TabBarItemConfigurable {
    
    func tabBarItemTitle() -> String
    func tabBarItemImageName(active: Bool) -> String
    
    func configureTabBarItem()
    
}

extension TabBarItemConfigurable where Self: UIViewController {
    
    func configureTabBarItem() {
        tabBarItem.title = tabBarItemTitle()
        tabBarItem.image = UIImage(named: tabBarItemImageName(active: false))
    }
}
