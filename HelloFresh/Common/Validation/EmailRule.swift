//
//  EmailRule.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 10/9/15.
//  Copyright © 2015 CxRomos. All rights reserved.
//

import Foundation

class EmailRule: RegexRule {
    
    static let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
    
    convenience init(message : String = "Must be a valid email address") {
        self.init(regex: EmailRule.regex, message: message)
    }
}
