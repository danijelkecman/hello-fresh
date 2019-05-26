//
//  RecipeDetailsRatingTableViewCell.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 10/9/15.
//  Copyright © 2015 CxRomos. All rights reserved.
//

import UIKit

protocol RecipeDetailsRatingCellProtocol: class {
  func didChangeRatingFor(with rating: Float)
}


class RecipeDetailsRatingCell: UITableViewCell, NibReusable, RatingControlProtocol {
  
  @IBOutlet weak var recipeRatedLabel: UILabel!
  @IBOutlet weak var ratingControl: RatingControl!
  weak var favouriteDelegate: RecipeDetailsRatingCellProtocol?
  
  func configure(with recipe: Recipe?) {
    guard let recipe = recipe else { return }
    ratingControl.rating = recipe.rating ?? 0
    ratingControl.ratingDelegate = self
    if recipe.rating == 0 {
      recipeRatedLabel.text = "Not rated yet"
    } else {
      recipeRatedLabel.text = "Recipe rated with: \(recipe.rating ?? 0)"
    }
  }
  
  func didChangeRatingWith(stars: Float) {
    favouriteDelegate?.didChangeRatingFor(with: stars)
  }
}

