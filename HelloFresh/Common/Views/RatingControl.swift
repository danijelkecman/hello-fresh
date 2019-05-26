//
//  RatingControl.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

protocol RatingControlProtocol: class {
  func didChangeRatingWith(stars: Float)
}

class RatingControl: UIView {
  
  weak var ratingDelegate: RatingControlProtocol?
  
  // MARK: Properties
  // when rating is set redo layout
  var rating: Float = 0 {
    didSet {
      setNeedsLayout()
    }
  }
  var ratingButtons = [UIButton]()
  var spacing = 5
  var stars = 5
  
  // MARK: Initialization
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    let filledStarImage = UIImage(named: "filledStar")
    let emptyStarImage = UIImage(named: "emptyStar")
    
    for _ in 0..<5 {
      let button = UIButton()
      
      button.setImage(emptyStarImage, for: UIControl.State())
      button.setImage(filledStarImage, for: .selected)
      button.setImage(filledStarImage, for: [.highlighted, .selected])
      
      button.adjustsImageWhenHighlighted = false
      
      button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchUpInside)
      ratingButtons += [button]
      addSubview(button)
    }
  }
  
  override func layoutSubviews() {
    // Set the button's width and height to a square the size of the frame's height.
    let buttonSize = Int(frame.size.height)
    var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
    
    // Offset each button's origin by the length of the button plus spacing.
    for (index, button) in ratingButtons.enumerated() {
      buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
      button.frame = buttonFrame
    }
    updateButtonSelectionStates()
  }
  
  override var intrinsicContentSize : CGSize {
    let buttonSize = Int(frame.size.height)
    let width = (buttonSize + spacing) * stars
    
    return CGSize(width: width, height: buttonSize)
  }
  
  // MARK: Button Action
  
  @objc func ratingButtonTapped(_ button: UIButton) {
    rating = Float(ratingButtons.firstIndex(of: button)!) + 1.0
    
    ratingDelegate?.didChangeRatingWith(stars: rating)
    
    updateButtonSelectionStates()
  }
  
  func updateButtonSelectionStates() {
    for (index, button) in ratingButtons.enumerated() {
      // If the index of a button is less than the rating, that button should be selected.
      button.isSelected = Float(index) < rating
    }
  }
  
}

