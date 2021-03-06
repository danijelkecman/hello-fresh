//
//  RecipeDetailsBodyTableViewCell.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 10/9/15.
//  Copyright © 2015 CxRomos. All rights reserved.
//

import UIKit

class RecipeDetailsBodyCell: UITableViewCell, NibReusable {
  
  @IBOutlet weak var recipeBody: UILabel!
  
  func configure(with recipe: Recipe?) {
    guard let recipe = recipe else { return }
    let recipeDetails = "Did you know?\n\(recipe.description)"
    var mutableString = NSMutableAttributedString()
    let font = UIFont(name: "Gill Sans", size: 14.0)!
    mutableString = NSMutableAttributedString(string: recipeDetails, attributes: [NSAttributedString.Key.font:font])
    self.recipeBody.attributedText = mutableString
  }
  
}

