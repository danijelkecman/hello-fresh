//
//  RecipeCellItem.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

struct RecipeCellItem {
    let recipeId: String
    let name: String
    let thumbnailUrl: String
    let imageUrl: String
    let calories: String
    let headline: String
    let time: String
    var rating: Int?
    var isFavourite: Bool
    var isFavouriteSet: Bool
    var image: UIImage? = nil
}

extension RecipeCellItem {
    
    mutating func set(image: UIImage?) {
        self.image = image
    }
    
    static func getItemFrom(recipeDto recipe: RecipeDto, isFavourite: Bool, isFavouriteSet: Bool) -> RecipeCellItem {
        return RecipeCellItem(recipeId: recipe.id,
                              name: recipe.name ?? "Delicious",
                              thumbnailUrl: recipe.thumb,
                              imageUrl: recipe.image,
                              calories: recipe.calories,
                              headline: recipe.headline,
                              time: recipe.time,
                              rating: recipe.rating,
                              isFavourite: isFavourite,
                              isFavouriteSet: isFavouriteSet, image: nil)
    }
    
}
