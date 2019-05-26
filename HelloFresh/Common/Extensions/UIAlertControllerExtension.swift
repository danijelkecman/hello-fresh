//
//  UIAlertControllerExtension.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

extension UIAlertController {
    class func basicAlert(message: String) -> UIAlertController {
        let alertController = UIAlertController(title: "Hello Fresh", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        return alertController
    }
    
    class func basicAlert(message: String, completion: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: "Hello Fresh", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (_) in
            completion()
        }
        alertController.addAction(action)
        return alertController
    }
    
    class func cancelAlert(title: String, message: String, confirmButtonTitle: String, confirmClosure: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: confirmButtonTitle, style: .default) { (_) in
            confirmClosure()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(action)
        alertController.addAction(cancelAction)
        return alertController
    }
}
