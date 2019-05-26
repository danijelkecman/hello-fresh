//
//  ManagedRecipeUser.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 5/26/19.
//  Copyright © 2019 Danijel Kecman. All rights reserved.
//

import CoreData

class ManagedRecipeUser: NSManagedObject {
  func toRecipeUser() -> RecipeUser {
    return RecipeUser(email: email, latlng: latlng, name: name)
  }
}
