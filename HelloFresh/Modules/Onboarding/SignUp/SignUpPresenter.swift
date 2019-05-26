//
//  SignUpPresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class SignUpPresenter {

    // MARK: - Private properties -

    fileprivate weak var _view: SignUpViewInterface?
    fileprivate var _interactor: SignUpInteractorInterface
    fileprivate var _wireframe: SignUpWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: SignUpWireframeInterface, view: SignUpViewInterface, interactor: SignUpInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
    
    func viewDidLoad() {
        log.info("SignUp Presenter viewDidLoad")
    }
}

// MARK: - Extensions -

extension SignUpPresenter: SignUpPresenterInterface {
    
    func navigateToMainScreen() {
        _wireframe.navigate(to: .main)
    }
}
