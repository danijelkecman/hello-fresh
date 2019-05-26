//
//  ValidationError.swift
//  Sandoz
//
//  Created by Danijel Kecman on 26/5/19.
//  Copyright © 2017 danijel. All rights reserved.
//

import Foundation
import UIKit

class ValidationError: NSObject {
    let textField: UITextField
    var errorTextField: UITextField?
    var errorLabel: UILabel?
    let errorMessage: String
    
    init(textField: UITextField, error: String) {
        self.textField = textField
        self.errorMessage = error
    }
    
    init(textField: UITextField, errorLabel: UILabel?, error: String) {
        self.textField = textField
        self.errorLabel = errorLabel
        self.errorMessage = error
    }
    
    init(textField: UITextField, errorTextField: UITextField?, error: String) {
        self.textField = textField
        self.errorTextField = errorTextField
        self.errorMessage = error
    }
}
