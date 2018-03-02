//
//  PasswordRule.swift
//  Sandoz
//
//  Created by Danijel Kecman on 1/20/17.
//  Copyright © 2017 Infinum. All rights reserved.
//

import Foundation

class UsernameRule: RegexRule {
    
    static let regex = "^(?=.*?[A-Z]).{8,}$"
    
    convenience init(message: String = "Must be 8 characters with 1 uppercase") {
        self.init(regex: UsernameRule.regex, message : message)
        
    }
}
