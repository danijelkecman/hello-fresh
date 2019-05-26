//
//  Progressable.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import MBProgressHUD

protocol Progressable {
    func showLoading()
    func showLoading(withMessage message: String)
    func hideLoading()
    func hideWithSuccess(withMessage message: String?)
    func hideWithError(withMessage message: String?)
}

extension Progressable where Self: UIViewController {
    
    func showLoading() {
        showLoading(withMessage: "")
    }
    
    func showLoading(withMessage message: String) {
        showHUD(withMessage: message)
    }
    
    func hideLoading() {
        if self is UITableViewController {
            MBProgressHUD.hide(for: self.navigationController?.view ?? self.view, animated: true)
        } else {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func hideWithSuccess(withMessage message: String?) {
        hideLoading()
        // Success image needed
        showHUD(withMessage: message, customView: UIImageView(), hideAfter: 3)
    }
    
    func hideWithError(withMessage message: String?) {
        hideLoading()
        // Error image needed
        showHUD(withMessage: message, customView: UIImageView(), hideAfter: 3)
    }
    
    fileprivate func showHUD(withMessage message: String? = nil, customView: UIView? = nil, hideAfter: TimeInterval? = nil) {
        let progressHUD: MBProgressHUD
        
        if self is UITableViewController {
            progressHUD = MBProgressHUD.showAdded(to: self.navigationController?.view ?? self.view, animated: true)
        } else {
            progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        progressHUD.label.text = message
        progressHUD.animationType = .zoom
        
        if let customView = customView {
            progressHUD.mode = .customView
            progressHUD.customView = customView
        }
        
        if let hideAfter = hideAfter {
            progressHUD.hide(animated: true, afterDelay: hideAfter)
        }
    }
    
}
