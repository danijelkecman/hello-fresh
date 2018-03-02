//
//  RequiredRule.swift
//  Sandoz
//
//  Created by Danijel Kecman on 1/20/17.
//  Copyright © 2017 Infinum. All rights reserved.
//

class RequiredRule: Rule {
    
    fileprivate var message: String
    
    init(message: String = "This field is required") {
        self.message = message
    }
    
    func validate(_ value: String) -> Bool {
        return !value.isEmpty
    }
    
    func errorMessage() -> String {
        return message
    }
}
