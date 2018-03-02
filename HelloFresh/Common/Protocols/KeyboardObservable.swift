//
//  KeyboardObservable.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
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
                         name: NSNotification.Name.UIKeyboardWillShow,
                         object: nil)
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillHide),
                         name: NSNotification.Name.UIKeyboardWillHide,
                         object: nil)
    }
    
    func unregisterKeyboardNotifications() {
        NotificationCenter.default
            .removeObserver(self,
                            name: NSNotification.Name.UIKeyboardWillShow,
                            object: nil)
        
        NotificationCenter.default
            .removeObserver(self,
                            name: NSNotification.Name.UIKeyboardWillHide,
                            object: nil)
    }
    
}
