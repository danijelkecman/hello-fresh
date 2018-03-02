//
//  SignUpWireframe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class SignUpWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = AppStoryboard.Onboarding.instance

    // MARK: - Module setup -

    func configureModule(with viewController: SignUpViewController) {
        let interactor = SignUpInteractor()
        let presenter = SignUpPresenter(wireframe: self, view: viewController, interactor: interactor)
        viewController.presenter = presenter
    }

    // MARK: - Transitions -

    func show(with transition: Transition, animated: Bool = true) {
        let moduleViewController = SignUpViewController.instantiateFrom(appStoryboard: .Onboarding)
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

extension SignUpWireframe: SignUpWireframeInterface {

    func navigate(to option: SignUpNavigationOption) {
        switch option {
        case .main:
            _navigateToTabBarModule()
        }
    }
}
