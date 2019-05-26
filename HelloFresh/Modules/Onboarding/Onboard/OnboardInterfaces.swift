//
//  OnboardInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

enum OnboardNavigationOption {
    case login
    case signup
}

protocol OnboardWireframeInterface: WireframeInterface {
    func navigate(to option: OnboardNavigationOption)
}

protocol OnboardViewInterface: ViewInterface {
}

protocol OnboardPresenterInterface: PresenterInterface {
    func didSelectLoginUserAction()
    func didSelectSignupUserAction()
}

protocol OnboardInteractorInterface: InteractorInterface {
}
