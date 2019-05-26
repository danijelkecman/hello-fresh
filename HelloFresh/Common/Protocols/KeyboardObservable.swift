//
//  KeyboardObservable.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

@objc protocol KeyboardObservable: class {
    func keyboardWillAppear(_ notification: Notification)
    func keyboardWillHide(_ notification: Notification)
}

extension KeyboardObservable where Self:UIViewController {
    
    func registerKeyboardNotifications() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillAppear),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillHide),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
    }
    
    func unregisterKeyboardNotifications() {
        NotificationCenter.default
            .removeObserver(self,
                            name: UIResponder.keyboardWillShowNotification,
                            object: nil)
        
        NotificationCenter.default
            .removeObserver(self,
                            name: UIResponder.keyboardWillHideNotification,
                            object: nil)
    }
    
}
