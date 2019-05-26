//
//  SignUpInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

enum SignUpNavigationOption {
    case main
}

protocol SignUpWireframeInterface: WireframeInterface {
    func navigate(to option: SignUpNavigationOption)
}

protocol SignUpViewInterface: ViewInterface {
}

protocol SignUpPresenterInterface: PresenterInterface {
    func navigateToMainScreen()
}

protocol SignUpInteractorInterface: InteractorInterface {
}
