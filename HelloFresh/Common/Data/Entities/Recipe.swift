//
//  Recipe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

struct Recipe {
    let recipeId: String
    var rating: Int
    var isFavourite: Bool
    var isFavouriteSet: Bool
}

extension Recipe {
    static func createRecipeFrom(recipeDto: RecipeDto) -> Recipe {
        return Recipe(recipeId: recipeDto.id, rating: recipeDto.rating ?? 0, isFavourite: false, isFavouriteSet: false)
    }
}
