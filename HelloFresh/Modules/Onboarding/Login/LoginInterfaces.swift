//
//  LoginInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import Alamofire

enum LoginNavigationOption {
    case main
}

protocol LoginWireframeInterface: WireframeInterface {
    func navigate(to option: LoginNavigationOption)
}

protocol LoginViewInterface: ViewInterface {
    func showLoginResultWith(message: String)
}

protocol LoginPresenterInterface: PresenterInterface {
    func loginUserActionHandlerWith(username: String, password: String)
    func navigateToMainScreen()
}

protocol LoginInteractorInterface: InteractorInterface {
    func loginUserWith(username: String, password: String, completion: @escaping ((Result<Bool>) -> Void))
}
