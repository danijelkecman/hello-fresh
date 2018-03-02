//
//  ManagedRecipe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import CoreData

class ManagedRecipe: NSManagedObject {
    func toRecipe() -> Recipe {
        return Recipe(recipeId: recipeId, rating: recipeRating, isFavourite: isFavourite, isFavouriteSet: isFavouriteSet)
    }
}
