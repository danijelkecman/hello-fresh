//
//  DataSourceable.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

protocol DataSourceable {
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
}

extension DataSourceable {
    
    func numberOfSections() -> Int {
        return 1
    }
    
}
