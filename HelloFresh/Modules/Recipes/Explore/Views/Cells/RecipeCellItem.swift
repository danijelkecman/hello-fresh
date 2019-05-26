//
//  RecipeCellItem.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

struct RecipeCellItem {
    var recipeId: String
    var name: String
    var thumbnailUrl: String
    var imageUrl: String
    var calories: String
    var headline: String
    var time: String
    var rating: Float?
    var isFavourite: Bool
    var isFavouriteSet: Bool
    var image: UIImage? = nil
}

extension RecipeCellItem {
    
    mutating func set(image: UIImage?) {
        self.image = image
    }
    
    static func getItemFrom(recipe: Recipe, isFavourite: Bool, isFavouriteSet: Bool) -> RecipeCellItem {
        return RecipeCellItem(recipeId: recipe.recipeId,
                              name: recipe.name ?? "Delicious",
                              thumbnailUrl: recipe.thumb,
                              imageUrl: recipe.image,
                              calories: recipe.calories,
                              headline: recipe.headline,
                              time: recipe.time,
                              rating: recipe.rating ?? 0,
                              isFavourite: isFavourite,
                              isFavouriteSet: isFavouriteSet,
                              image: nil)
    }
    
}
