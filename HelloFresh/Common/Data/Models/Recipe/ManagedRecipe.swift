//
//  ManagedRecipe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 26/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import CoreData

class ManagedRecipe: NSManagedObject {
    func toRecipe() -> Recipe {
        return Recipe(recipeId: recipeId, calories: calories, carbos: carbos, card: card, country: country, deliverableIngredients: deliverableIngredients, undeliverableIngredients: undeliverableIngredients, description: recipeDescription, difficulty: difficulty, fats: fats, favorites: favorites, fibers: fibers, headline: headline, highlighted: highlighted, image: image, incompatibilities: incompatibilities, ingredients: ingredients, keywords: keywords, name: name, products: products, proteins: proteins, rating: rating, ratings: ratings, thumb: thumb, time: time, user: RecipeUser(email: recipeUser.email, latlng: recipeUser.latlng, name: recipeUser.name), weeks: weeks, isFavourite: isFavourite, currentRating: currentRating)
    }
}
