//
//  UIFontExtensions.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/16/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func defaultHelloFreshFont() -> UIFont {
        return UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
    }
    
    class func helloFreshSelectionInactiveFont() -> UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.medium)
    }
    
    class func helloFreshSelectionActiveFont() -> UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.medium)
    }
    
    class func titleHelloFreshFont() -> UIFont {
        return UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.medium)
    }
    
    class func headingFont(ofSize size: CGFloat = 16.0) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
    }
    
    class func headingInactiveFont() -> UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
    }
    
    class func heading2Font() -> UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
    }
    
    class func bodyFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular)
    }
    
    class func subheadingFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular)
    }
    
    class func tabActiveFont() -> UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: UIFont.Weight.semibold)
    }
    
    class func tabInactiveFont() -> UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: UIFont.Weight.semibold)
    }
    
    class func labelFont() -> UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: UIFont.Weight.semibold)
    }
    
    class func caption2Font() -> UIFont {
        return UIFont.systemFont(ofSize: 11.0, weight: UIFont.Weight.regular)
    }
    
    class func tabLabelFont() -> UIFont {
        return UIFont.systemFont(ofSize: 9.0, weight: UIFont.Weight.semibold)
    }
    
    class func topAlertViewFont() -> UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: UIFont.Weight.medium)
    }
    
    class func tableViewHeaderFont() -> UIFont {
        return labelFont()
    }
    
    class func tableViewFooterFont() -> UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.medium)
    }
}
