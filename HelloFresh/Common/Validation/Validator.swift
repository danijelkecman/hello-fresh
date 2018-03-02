//
//  Validator.swift
//  Sandoz
//
//  Created by Danijel Kecman on 1/20/17.
//  Copyright © 2017 Infinum. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ValidationDelegate {
    func validationSuccessful()
    func validationFailed(_ errors: [UITextField: ValidationError])
}

class Validator {
    // Dictionary to handle complex view hierarchies like dynamic tableview cells
    var errors = [UITextField: ValidationError]()
    var validations = [UITextField: ValidationRule]()
    fileprivate var successStyleTransform:((_ validationRule: ValidationRule) -> Void)?
    fileprivate var errorStyleTransform:((_ validationError: ValidationError) -> Void)?
    
    init() {}
    
    // MARK: Private functions
    
    fileprivate func validateAllFields() {
        
        errors = [:]
        
        for (textField, rule) in validations {
            if let error = rule.validateField() {
                errors[textField] = error
                
                if let transform = self.errorStyleTransform {
                    transform(error)
                }
            } else {
                if let transform = self.successStyleTransform {
                    transform(rule)
                }
            }
        }
    }
    
    // MARK: Using Keys
    
    func styleTransformers(success: ((_ validationRule: ValidationRule) -> Void)?, error: ((_ validationError: ValidationError) -> Void)?) {
        self.successStyleTransform = success
        self.errorStyleTransform = error
    }
    
    func registerField(_ textField: UITextField, rules: [Rule]) {
        validations[textField] = ValidationRule(textField: textField, rules: rules, errorLabel: nil)
    }
    
    func registerField(_ textField: UITextField, errorLabel: UILabel, rules: [Rule]) {
        validations[textField] = ValidationRule(textField: textField, rules: rules, errorLabel: errorLabel)
    }
    
    func registerField(_ textField: UITextField, errorTextField: UITextField, rules: [Rule]) {
        validations[textField] = ValidationRule(textField: textField, rules: rules, errorTextField: errorTextField)
    }
    
    func unregisterField(_ textField: UITextField) {
        validations.removeValue(forKey: textField)
        errors.removeValue(forKey: textField)
    }
    
    func validate(_ delegate: ValidationDelegate) {
        self.validateAllFields()
        
        if errors.isEmpty {
            delegate.validationSuccessful()
        } else {
            delegate.validationFailed(errors)
        }
    }
    
    func validate(_ callback: (_ errors: [UITextField: ValidationError]) -> Void) -> Void {
        self.validateAllFields()
        
        callback(errors)
    }
}
