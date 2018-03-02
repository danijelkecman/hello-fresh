//
//  PasswordRule.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 10/9/15.
//  Copyright © 2015 CxRomos. All rights reserved.
//

import Foundation

class PasswordRule : RegexRule {
    
    static let regex = "^(?=.*?[A-Z]).{8,}$"
    
 convenience init(message : String = "Password must be 8 characters with 1 uppercase") {
        self.init(regex: PasswordRule.regex, message : message)
        
    }
}
