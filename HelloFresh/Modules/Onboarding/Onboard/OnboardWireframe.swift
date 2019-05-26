//
//  OnboardWireframe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class OnboardWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = AppStoryboard.Onboarding.instance

    // MARK: - Module setup -

    func configureModule(with viewController: OnboardViewController) {
        let presenter = OnboardPresenter(wireframe: self, view: viewController)
        viewController.presenter = presenter
    }

    // MARK: - Transitions -

    func show(with transition: Transition, animated: Bool = true) {
        let moduleViewController = OnboardViewController.instantiateFrom(appStoryboard: .Onboarding)
        configureModule(with: moduleViewController)

        show(moduleViewController, with: transition, animated: animated)
    }
    
    fileprivate func _navigateToLoginScreen() {
        let wireframe = LoginWireframe(navigationController: self.navigationController)
        wireframe.show(with: .push)
    }
    
    fileprivate func _navigateToSignUpScreen() {
        let wireframe = SignUpWireframe(navigationController: self.navigationController)
        wireframe.show(with: .push)
    }
}

// MARK: - Extensions -

extension OnboardWireframe: OnboardWireframeInterface {

    func navigate(to option: OnboardNavigationOption) {
        switch option {
        case .login:
            _navigateToLoginScreen()
        case .signup:
            _navigateToSignUpScreen()
        }
    }
}
