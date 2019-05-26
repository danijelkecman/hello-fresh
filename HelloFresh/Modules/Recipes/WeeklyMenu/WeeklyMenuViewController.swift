//
//  WeeklyMenuViewController.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class WeeklyMenuViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: WeeklyMenuPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
	
    // MARK: - Private methods -
    
    private func _configure() {
        self.title = "Weekly Menu"
    }
}

// MARK: - Extensions -

extension WeeklyMenuViewController: WeeklyMenuViewInterface {
}

// MARK: - TabBar Extension

extension WeeklyMenuViewController: TabBarItemConfigurable {
    
    func tabBarItemTitle() -> String {
        return "Weekly Menu"
    }
    
    func tabBarItemImageName(active: Bool) -> String {
        return active ? "icRecipesOrange" : "icRecipesGrey"
    }
    
    func configureTabBarItem() {
        let fontAttributes = [NSAttributedString.Key.font: UIFont.tabLabelFont()]
        
        tabBarItem.title = tabBarItemTitle()
        tabBarItem.image = UIImage(named: tabBarItemImageName(active: false))
        tabBarItem.selectedImage = UIImage(named: tabBarItemImageName(active: true))
        tabBarItem.setTitleTextAttributes(fontAttributes, for: .normal)
    }
}
