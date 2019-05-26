//
//  OnboardingTextField.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/11/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

class OnboardingTextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
