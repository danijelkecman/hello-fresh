//
//  TabBarWireframe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class TabBarWireframe: BaseWireframe {
    
    // MARK: - Private properties -
    
    private let _storyboard = AppStoryboard.TabBar.instance
    private var _wireframes: [BaseWireframe] = []
    
    // MARK: - Lifecycle -
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        
        // Initialize all wireframes
        let exploreRecipesNavigationController = UINavigationController()
        let exploreRecipesWireframe = ExploreRecipesWireframe(navigationController: exploreRecipesNavigationController)
        exploreRecipesWireframe.show(with: .root)
        
        let weklyMenuNavigationController = UINavigationController()
        let weeklyMenuWireframe = WeeklyMenuWireframe(navigationController: weklyMenuNavigationController)
        weeklyMenuWireframe.show(with: .root)
        
        let profileNavigationController = UINavigationController()
        let profileWireframe = ProfileWireframe(navigationController: profileNavigationController)
        profileWireframe.show(with: .root)
        
        // Set wireframes
        _wireframes = [exploreRecipesWireframe, weeklyMenuWireframe, profileWireframe]
    }
    
    // MARK: - Module setup -
    
    func configureModule(with viewController: TabBarViewController) {
        let presenter = TabBarPresenter(wireframe: self, view: viewController)
        viewController.presenter = presenter
        viewController.viewControllers = _wireframes.map { $0.navigationController }
    }
    
    func show(with transition: Transition, animated: Bool = true) {
        let moduleViewController = instantiateAndConfigureModule()
        
        show(moduleViewController, with: transition, animated: animated)
    }
    
    func instantiateAndConfigureModule() -> TabBarViewController {
        let moduleViewController = TabBarViewController.instantiateFrom(appStoryboard: .TabBar)
        configureModule(with: moduleViewController)
        
        return moduleViewController
    }
    
}

// MARK: - Extensions -

extension TabBarWireframe: TabBarWireframeInterface {
    
    func navigate(to option: TabBarNavigationOption) {
    }
    
}
