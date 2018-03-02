//
//  AppDelegate.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterInterface: class {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

extension PresenterInterface {
    
    func viewDidLoad() {
        fatalError("Implementation pending...")
    }
    
    func viewWillAppear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewDidAppear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewWillDisappear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewDidDisappear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }
    
}
