//
//  RecipeDetailsRatingTableViewCell.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 10/9/15.
//  Copyright © 2015 CxRomos. All rights reserved.
//

import UIKit

protocol RecipeDetailsRatingCellProtocol: class {
    func didChangeRatingFor(with rating: Int)
}


class RecipeDetailsRatingCell: UITableViewCell, NibReusable, RatingControlProtocol {

    @IBOutlet weak var recipeRatedLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    weak var favouriteDelegate: RecipeDetailsRatingCellProtocol?
    
    func configure(with recipeDto: RecipeDto) {
        ratingControl.rating = recipeDto.rating ?? 0
        ratingControl.ratingDelegate = self
        if recipeDto.rating == nil {
            recipeRatedLabel.text = "Not rated yet"
        } else {
            recipeRatedLabel.text = "Recipe rated with: \(recipeDto.rating ?? 0)"
        }
    }
    
    func didChangeRatingWith(stars: Int) {
        favouriteDelegate?.didChangeRatingFor(with: stars)
    }
}
