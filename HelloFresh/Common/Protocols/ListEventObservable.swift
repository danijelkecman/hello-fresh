//
//  ListEventObservable.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

protocol ListEventObservable {
    func didSelectItem(at indexPath: IndexPath)
}
