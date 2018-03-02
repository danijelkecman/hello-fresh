//
//  ManagedRecipe+CoreDataProperties.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import CoreData

extension ManagedRecipe {
    @NSManaged var recipeId: String
    @NSManaged var recipeRating: Int
    @NSManaged var isFavourite: Bool
    @NSManaged var isFavouriteSet: Bool
}

