//
//  TabBarViewController.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    // MARK: - Public properties -
    
    var presenter: TabBarPresenterInterface!
    
    // MARK: - Life cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Private functions -
    
    private func _configure() {
        // Tab bar controller delegate
        self.delegate = self
    }
}

// MARK: - Extensions -

extension TabBarViewController: TabBarViewInterface {
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
