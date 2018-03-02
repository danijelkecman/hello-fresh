//
//  ValidationError.swift
//  Sandoz
//
//  Created by Danijel Kecman on 1/20/17.
//  Copyright © 2017 Infinum. All rights reserved.
//

import Foundation
import UIKit

class ValidationRule {
    var textField: UITextField
    var errorTextField: UITextField?
    var errorLabel: UILabel?
    var rules: [Rule] = []
    
    init(textField: UITextField, rules: [Rule], errorLabel: UILabel?) {
        self.textField = textField
        self.errorLabel = errorLabel
        self.rules = rules
    }
    
    init(textField: UITextField, rules: [Rule], errorTextField: UITextField?) {
        self.textField = textField
        self.errorTextField = errorTextField
        self.rules = rules
    }
    
    func validateField() -> ValidationError? {
        if errorTextField != nil {
            return rules.filter { !$0.validate(self.textField.text ?? "") }
                .map { rule -> ValidationError in
                    return ValidationError(textField: self.textField, errorTextField: self.errorTextField, error: rule.errorMessage())
                }.first
        }
        return rules.filter { !$0.validate(self.textField.text ?? "") }
            .map { rule -> ValidationError in
                return ValidationError(textField: self.textField, errorLabel: self.errorLabel, error: rule.errorMessage())
            }.first
    }
}
