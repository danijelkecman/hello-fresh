//
//  ProfilePresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class ProfilePresenter {

    // MARK: - Private properties -

    fileprivate weak var _view: ProfileViewInterface?
    fileprivate var _interactor: ProfileInteractorInterface
    fileprivate var _wireframe: ProfileWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: ProfileWireframeInterface, view: ProfileViewInterface, interactor: ProfileInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
    
    func viewDidLoad() {
        log.info("Profile Presenter viewDidLoad")
    }
}

// MARK: - Extensions -

extension ProfilePresenter: ProfilePresenterInterface {
    func didSelectLogoutAction() {
        _wireframe.navigate(to: .logout)
    }
}
