//
//  WeeklyMenuPresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class WeeklyMenuPresenter {

    // MARK: - Private properties -

    fileprivate weak var _view: WeeklyMenuViewInterface?
    fileprivate var _interactor: WeeklyMenuInteractorInterface
    fileprivate var _wireframe: WeeklyMenuWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: WeeklyMenuWireframeInterface, view: WeeklyMenuViewInterface, interactor: WeeklyMenuInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
    
    func viewDidLoad() {
        log.info("Weekly Menu Presenter viewDidLoad")
    }
}

// MARK: - Extensions -

extension WeeklyMenuPresenter: WeeklyMenuPresenterInterface {
}
