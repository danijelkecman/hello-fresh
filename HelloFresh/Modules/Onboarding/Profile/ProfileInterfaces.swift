//
//  ProfileInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

enum ProfileNavigationOption {
    case logout
}

protocol ProfileWireframeInterface: WireframeInterface {
    func navigate(to option: ProfileNavigationOption)
}

protocol ProfileViewInterface: ViewInterface {
}

protocol ProfilePresenterInterface: PresenterInterface {
    func didSelectLogoutAction()
}

protocol ProfileInteractorInterface: InteractorInterface {
}
