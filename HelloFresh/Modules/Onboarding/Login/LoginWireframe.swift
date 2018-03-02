//
//  LoginWireframe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class LoginWireframe: BaseWireframe {

    // MARK: - Private properties -
    
    private let _storyboard = AppStoryboard.Onboarding.instance

    // MARK: - Module setup -

    func configureModule(with viewController: LoginViewController) {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(wireframe: self, view: viewController, interactor: interactor)
        viewController.presenter = presenter
    }

    // MARK: - Transitions -

    func show(with transition: Transition, animated: Bool = true) {
        let moduleViewController = LoginViewController.instantiateFrom(appStoryboard: .Onboarding)
        configureModule(with: moduleViewController)

        show(moduleViewController, with: transition, animated: animated)
    }

    fileprivate func _navigateToTabBarModule() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        
        UIView.transition(with: window, duration: 0.6, options: .transitionFlipFromLeft, animations: {
            let navigationController = UINavigationController()
            navigationController.setNavigationBarHidden(true, animated: false)
            let wireframe = TabBarWireframe(navigationController: navigationController)
            window.rootViewController = wireframe.instantiateAndConfigureModule()
        }, completion: nil)
    }

}

// MARK: - Extensions -

extension LoginWireframe: LoginWireframeInterface {

    func navigate(to option: LoginNavigationOption) {
        switch option {
        case .main:
            _navigateToTabBarModule()
        }
    }
}
