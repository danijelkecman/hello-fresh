//
//  Alertable.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

protocol Alertable {
    func showBasicAlert(message: String)
    func showBasicAlert(message: String, completion: @escaping () -> Void)
    func showDefaultErrorMessage()
    func showAlertWith(message: String, actions: [UIAlertAction]?, cancelAction: UIAlertAction?)
}

extension Alertable where Self: UIViewController {
    
    func showBasicAlert(message: String) {
        let alert = UIAlertController.basicAlert(message: message)
        if let navigationController = self.navigationController {
            navigationController.present(alert, animated: true, completion: nil)
        } else {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showBasicAlert(message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController.basicAlert(message: message, completion: completion)
        if let navigationController = self.navigationController {
            navigationController.present(alert, animated: true, completion: nil)
        } else {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showDefaultErrorMessage() {
        showBasicAlert(message: "General problem")
    }
    
    func showAlertWith(message: String, actions: [UIAlertAction]?, cancelAction: UIAlertAction?) {
        
    }
}
