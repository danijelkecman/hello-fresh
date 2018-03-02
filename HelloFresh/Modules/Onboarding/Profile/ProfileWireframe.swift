//
//  ProfileWireframe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class ProfileWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = AppStoryboard.Onboarding.instance

    // MARK: - Module setup -

    func configureModule(with viewController: ProfileViewController) {
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(wireframe: self, view: viewController, interactor: interactor)
        viewController.presenter = presenter
        viewController.configureTabBarItem()
    }

    // MARK: - Transitions -

    func show(with transition: Transition, animated: Bool = true) {
        let moduleViewController = ProfileViewController.instantiateFrom(appStoryboard: .Onboarding)
        configureModule(with: moduleViewController)

        show(moduleViewController, with: transition, animated: animated)
    }
}

// MARK: - Extensions -

extension ProfileWireframe: ProfileWireframeInterface {

    func navigate(to option: ProfileNavigationOption) {
        switch option {
        case .logout:
            if let window = UIApplication.shared.keyWindow {
                UIView.transition(with: window, duration: 0.6, options: .transitionFlipFromRight, animations: {
                    let navigationController = UINavigationController()
                    navigationController.setNavigationBarHidden(true, animated: false)
                    
                    let wireframe = OnboardWireframe(navigationController: navigationController)
                    wireframe.show(with: .root)
                    window.rootViewController = navigationController
                }, completion: nil)
            }
        }
    }
}
