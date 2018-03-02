//
//  LoginPresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class LoginPresenter {

    // MARK: - Private properties -

    fileprivate weak var _view: LoginViewInterface?
    fileprivate var _interactor: LoginInteractorInterface
    fileprivate var _wireframe: LoginWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: LoginWireframeInterface, view: LoginViewInterface, interactor: LoginInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
    
    func viewDidLoad() {
        log.info("Login Presenter viewDidLoad")
    }
}

// MARK: - Extensions -

extension LoginPresenter: LoginPresenterInterface {
    
    func loginUserActionHandlerWith(username: String, password: String) {
        navigateToMainScreen()
//        _interactor.loginUserWith(username: username, password: password) { [weak self] result in
//            switch result {
//            case .success(_):
//                self?._wireframe.navigate(to: .main)
//            case .failure(_):
//                self?._view?.showLoginResultWith(message: "Login failed with provided username/password")
//            }
//        }
    }
    
    func navigateToMainScreen() {
        _wireframe.navigate(to: .main)
    }
}
