//
//  ManagedRecipe+CoreDataProperties.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 26/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import CoreData

extension ManagedRecipe {
  @NSManaged var recipeId: String
  @NSManaged var calories: String
  @NSManaged var carbos: String
  @NSManaged var card: String
  @NSManaged var country: String
  @NSManaged var deliverableIngredients: [String]
  @NSManaged var undeliverableIngredients: [String]
  @NSManaged var recipeDescription: String
  @NSManaged var difficulty: Int
  @NSManaged var fats: String
  @NSManaged var favorites: Int
  @NSManaged var fibers: String
  @NSManaged var headline: String
  @NSManaged var highlighted: Bool
  @NSManaged var image: String
  @NSManaged var incompatibilities: String?
  @NSManaged var ingredients: [String]
  @NSManaged var keywords: [String]
  @NSManaged var name: String?
  @NSManaged var products: [String]
  @NSManaged var proteins: String
  @NSManaged var rating: Float
  @NSManaged var ratings: Int
  @NSManaged var thumb: String
  @NSManaged var time: String
  @NSManaged var weeks: [String]
  @NSManaged var isFavourite: Bool
  @NSManaged var currentRating: Int
  @NSManaged var recipeUser: ManagedRecipeUser
}

