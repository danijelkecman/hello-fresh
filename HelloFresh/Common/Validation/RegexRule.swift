//
//  RegexRule.swift
//  Sandoz
//
//  Created by Danijel Kecman on 1/20/17.
//  Copyright © 2017 Infinum. All rights reserved.
//

import Foundation

class RegexRule: Rule {
    
    fileprivate var REGEX: String = "^(?=.*?[A-Z]).{8,}$"
    fileprivate var message: String
    
    init(regex: String, message: String = "Invalid Regular Expression") {
        self.REGEX = regex
        self.message = message
    }
    
    func validate(_ value: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", self.REGEX)
        return test.evaluate(with: value)
    }
    
    func errorMessage() -> String {
        return message
    }
}
