//
//  WeeklyMenuInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
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
