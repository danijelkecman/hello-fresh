//
//  WeeklyMenuWireframe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class WeeklyMenuWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = AppStoryboard.Onboarding.instance

    // MARK: - Module setup -

    func configureModule(with viewController: WeeklyMenuViewController) {
        let interactor = WeeklyMenuInteractor()
        let presenter = WeeklyMenuPresenter(wireframe: self, view: viewController, interactor: interactor)
        viewController.presenter = presenter
        viewController.configureTabBarItem()
    }

    // MARK: - Transitions -

    func show(with transition: Transition, animated: Bool = true) {
        let moduleViewController = WeeklyMenuViewController.instantiateFrom(appStoryboard: .Recipes)
        configureModule(with: moduleViewController)

        show(moduleViewController, with: transition, animated: animated)
    }
}

// MARK: - Extensions -

extension WeeklyMenuWireframe: WeeklyMenuWireframeInterface {

    func navigate(to option: WeeklyMenuNavigationOption) {
    }
}
