//
//  Rule.swift
//  Sandoz
//
//  Created by Danijel Kecman on 1/20/17.
//  Copyright © 2017 Infinum. All rights reserved.
//

import Foundation

protocol Rule {
    func validate(_ value: String) -> Bool
    func errorMessage() -> String
}
