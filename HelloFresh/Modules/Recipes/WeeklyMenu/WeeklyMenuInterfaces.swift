//
//  WeeklyMenuInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

enum WeeklyMenuNavigationOption {
}

protocol WeeklyMenuWireframeInterface: WireframeInterface {
    func navigate(to option: WeeklyMenuNavigationOption)
}

protocol WeeklyMenuViewInterface: ViewInterface {
}

protocol WeeklyMenuPresenterInterface: PresenterInterface {
}

protocol WeeklyMenuInteractorInterface: InteractorInterface {
}
