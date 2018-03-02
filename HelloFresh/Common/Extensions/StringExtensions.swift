//
//  StringExtensions.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        // TODO: Implement language based localisation in a separate component LanguageManager or similar
        return NSLocalizedString(self, comment: "MISSING_LOCALIZATION_KEY: \(self)")
    }
}
