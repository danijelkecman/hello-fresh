//
//  ProfileViewController.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: ProfilePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Actions 
    
    @IBAction func logoutActionHandler(_ sender: RoundedButton) {
        presenter.didSelectLogoutAction()
    }
    
	
}

// MARK: - Extensions -

extension ProfileViewController: ProfileViewInterface {
}

// MARK: - TabBar Extension

extension ProfileViewController: TabBarItemConfigurable {
    
    func tabBarItemTitle() -> String {
        return "Profile"
    }
    
    func tabBarItemImageName(active: Bool) -> String {
        return active ? "icProfileOrange" : "icProfileGrey"
    }
    
    func configureTabBarItem() {
        let fontAttributes = [NSAttributedString.Key.font: UIFont.tabLabelFont()]
        
        tabBarItem.title = tabBarItemTitle()
        tabBarItem.image = UIImage(named: tabBarItemImageName(active: false))
        tabBarItem.selectedImage = UIImage(named: tabBarItemImageName(active: true))
        tabBarItem.setTitleTextAttributes(fontAttributes, for: .normal)
    }
}
