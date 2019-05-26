//
//  PasswordRule.swift
//  Sandoz
//
//  Created by Danijel Kecman on 26/5/19.
//  Copyright © 2017 danijel. All rights reserved.
//

import Foundation

class UsernameRule: RegexRule {
    
    static let regex = "^(?=.*?[A-Z]).{8,}$"
    
    convenience init(message: String = "Must be 8 characters with 1 uppercase") {
        self.init(regex: UsernameRule.regex, message : message)
        
    }
}
