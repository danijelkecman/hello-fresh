//
//  BalanceButton.swift
//  BTWallet
//
//  Created by Danijel Kecman on 26/5/19.
//  Copyright © 2017 Endava. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    // MARK: - Lifecycle -
    
    required init?(coder aDecoder: NSCoder) {
        borderColor = UIColor.hfGreen
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        borderColor = UIColor.hfGreen
        super.init(frame: frame)
        commonInit()
    }
    
    
    // MARK: - Private functions -
    
    private func commonInit() {
        layer.cornerRadius = frame.size.width / 12.5
        layer.borderWidth = 2
        layer.borderColor = UIColor.hfGreen.cgColor
        
        titleLabel?.textAlignment = .center
        
        let padding: CGFloat = 10.0
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: padding)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right,
                      height: size.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom)
    }
    
    // MARK: - Public methods and properties
    
    var borderColor: UIColor {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
