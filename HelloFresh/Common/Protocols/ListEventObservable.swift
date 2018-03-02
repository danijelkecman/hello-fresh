//
//  ListEventObservable.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

protocol ListEventObservable {
    func didSelectItem(at indexPath: IndexPath)
}
