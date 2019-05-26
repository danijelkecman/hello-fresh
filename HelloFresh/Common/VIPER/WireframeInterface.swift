//
//  AppDelegate.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

enum Transition {
    case root
    case push
    case present(fromViewController: UIViewController)
}

protocol WireframeInterface: class {
    func popFromNavigationController(_ animated: Bool)
    func popToRoot(animated: Bool)
    func dismiss(_ animated: Bool)
    func showActivity(withItems items: [Any],
                      andActivities activities: [UIActivity]?,
                      handler: @escaping (UIActivity.ActivityType?, Bool, [Any]?, Error?) -> Swift.Void)
    
    func open(_ url: String)
    func open(_ url: URL)
}

class BaseWireframe {
    
    // MARK: - Base behaviour -
    
    unowned var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func show(_ viewController: UIViewController, with transition: Transition, animated: Bool) {
        switch transition {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
            
        case .present(let fromViewController):
            navigationController.viewControllers = [viewController]
            fromViewController.present(navigationController, animated: animated, completion: nil)
            
        case .root:
            navigationController.setViewControllers([viewController], animated: animated)
        }
    }
}

extension BaseWireframe: WireframeInterface {
    
    // MARK: - Navigation -
    
    func popFromNavigationController(_ animated: Bool = true) {
        let _ = navigationController.popViewController(animated: animated)
    }
    
    func dismiss(_ animated: Bool = true) {
        navigationController.dismiss(animated: animated)
    }
        
    // MARK: - Activity Controller
    
    func showActivity(withItems items: [Any],
                      andActivities activities: [UIActivity]?,
                      handler: @escaping (UIActivity.ActivityType?, Bool, [Any]?, Error?) -> Swift.Void) {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: activities)
        activityViewController.completionWithItemsHandler = handler
        self.navigationController.present(activityViewController, animated: true, completion: nil)
    }
        
    // MARK: - URL handling -
    
    func open(_ url: String) {
        guard let _url = URL(string: url) else {
            return
        }
        
        open(_url)
    }

    func open(_ url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
