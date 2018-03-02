//
//  TabBarInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

enum TabBarNavigationOption {
}

protocol TabBarWireframeInterface: WireframeInterface {
    func navigate(to option: TabBarNavigationOption)
}

protocol TabBarViewInterface: ViewInterface {
}

protocol TabBarPresenterInterface: PresenterInterface {
}

protocol TabBarInteractorInterface: InteractorInterface {
}
