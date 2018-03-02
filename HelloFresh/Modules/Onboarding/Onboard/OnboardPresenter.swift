//
//  OnboardPresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class OnboardPresenter {

    // MARK: - Private properties -

    fileprivate weak var _view: OnboardViewInterface?
    fileprivate var _wireframe: OnboardWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: OnboardWireframeInterface, view: OnboardViewInterface) {
        _wireframe = wireframe
        _view = view
    }
    
    func viewDidLoad() {
        log.info("Onboard Presenter viewDidLoad")
    }
}

// MARK: - Extensions -

extension OnboardPresenter: OnboardPresenterInterface {
    func didSelectLoginUserAction() {
        _wireframe.navigate(to: .login)
    }
    
    func didSelectSignupUserAction() {
        _wireframe.navigate(to: .signup)
    }
}
