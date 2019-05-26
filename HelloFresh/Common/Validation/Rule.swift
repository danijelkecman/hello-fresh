//
//  Rule.swift
//  Sandoz
//
//  Created by Danijel Kecman on 26/5/19.
//  Copyright © 2017 danijel. All rights reserved.
//

import Foundation

protocol Rule {
    func validate(_ value: String) -> Bool
    func errorMessage() -> String
}
