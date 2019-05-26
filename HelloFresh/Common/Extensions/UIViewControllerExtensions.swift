//
//  ViewControllerExtensions.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import Spring
import SnapKit

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiateFrom(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func removeBackText(from controller: UIViewController,
                        backButtonColor: UIColor = UIColor.white) {
        controller.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        controller.navigationItem.backBarButtonItem?.tintColor = backButtonColor
    }
    
    func removeBackText(from controller: UIViewController,
                        backImageName imageName: String, backImageColor color: UIColor) {
        controller.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        controller.navigationController?.navigationBar.backIndicatorImage = UIImage(named: imageName)
        controller.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: imageName)
        controller.navigationController?.navigationBar.tintColor = color
    }
    
    func displayTopAlertViewWith(message: String) {
        displayTopAlertViewWith(message: message, completion: nil)
    }
    
    func displayTopAlertViewWith(message: String, completion: (() -> Void)?) {
        let alertView = SpringView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 33))
        let labelMessage = UILabel(frame: alertView.bounds)
        
        alertView.backgroundColor = UIColor.coolGreen
        alertView.damping = 0.85
        alertView.velocity = 0.1
        alertView.animation = "squeezeDown"
        
        labelMessage.numberOfLines = 0
        labelMessage.lineBreakMode = .byWordWrapping
        labelMessage.textAlignment = .center
        labelMessage.textColor = UIColor.white
        labelMessage.font = UIFont.topAlertViewFont()
        labelMessage.text = message
        labelMessage.sizeToFit()
        
        alertView.addSubview(labelMessage)
        view.addSubview(alertView)
        
        alertView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.width.equalTo(view.bounds.width)
            make.height.equalTo(labelMessage.bounds.height + 16)
        }
        
        labelMessage.snp.makeConstraints { make in
            make.edges.equalTo(alertView.snp.edges)
            make.center.equalTo(alertView)
        }
        
        alertView.animateNext {
            UIView.animate(withDuration: 0.25, delay: 1.75, options: .curveEaseIn,
                           animations: {
                            alertView.frame.origin.y -= alertView.frame.height
            },
                           completion: { _ in
                            alertView.removeFromSuperview()
                            guard let _completion = completion else {
                                return
                            }
                            _completion()
            })
        }
    }
    
    func setNavigationBarShadowVisible(_ isVisible: Bool) {
        if isVisible {
            navigationController?.navigationBar.layer.borderColor = UIColor.white.cgColor
            navigationController?.navigationBar.layer.borderWidth = 1.0
            navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
            navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            navigationController?.navigationBar.layer.shadowRadius = 2.5
            navigationController?.navigationBar.layer.shadowOpacity = 0.08
            navigationController?.navigationBar.layer.masksToBounds = false
            navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            navigationController?.navigationBar.layer.masksToBounds = true
        }
    }
}
