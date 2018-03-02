//
//  TabBarPresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class TabBarPresenter {
    
    // MARK: - Private properties -
    
    fileprivate weak var _view: TabBarViewInterface?
    fileprivate var _wireframe: TabBarWireframeInterface
    
    // MARK: - Lifecycle -
    
    init (wireframe: TabBarWireframeInterface, view: TabBarViewInterface) {
        _wireframe = wireframe
        _view = view
    }
    
}

// MARK: - Extensions -

extension TabBarPresenter: TabBarPresenterInterface {
}
