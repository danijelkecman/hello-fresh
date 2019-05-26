//
//  TabBarInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
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
