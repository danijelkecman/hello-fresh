//
//  UsersStoreExtension.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import CoreData

extension HelloFreshDataStore: HelloFreshPersistenceProtocol {
  func fetchUser(_ email: String, completionHandler: @escaping (_ user: () throws -> User?) -> Void) {
    privateManagedObjectContext.perform {
      do {
        let fetchRequest = NSFetchRequest<ManagedUser>(entityName: "ManagedUser")
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        let results = try self.privateManagedObjectContext.fetch(fetchRequest)
        if let user = results.first?.toUser() {
          completionHandler { return user }
        } else {
          throw HelloFreshStoreError.cannotFetch("Cannot fetch user with id \(email)")
        }
      } catch {
        log.error(error)
        completionHandler { throw HelloFreshStoreError.cannotFetch("Cannot fetch user with id \(email)") }
      }
    }
  }
  
  func createUser(_ userToCreate: User, completionHandler: @escaping (_ done: () throws -> Void) -> Void) {
    privateManagedObjectContext.perform {
      do {
        let managedUser = NSEntityDescription.insertNewObject(forEntityName: "ManagedUser", into: self.privateManagedObjectContext) as! ManagedUser
        managedUser.email = userToCreate.email
        // actually a hash and keychain but this is demo of other things
        managedUser.password = userToCreate.password
        try self.privateManagedObjectContext.save()
        completionHandler { return }
      } catch {
        log.error(error)
        completionHandler { throw HelloFreshStoreError.cannotCreate("Cannot create user with email \(userToCreate.email)") }
      }
    }
  }
  
  func fetchRecipes(_ completionHandler: @escaping (_ recipes: () throws -> [Recipe]) -> Void) {
    privateManagedObjectContext.perform {
      do {
        let fetchRequest = NSFetchRequest<ManagedRecipe>(entityName: "ManagedRecipe")
        let results = try self.privateManagedObjectContext.fetch(fetchRequest)
        let recipes = results.map { $0.toRecipe() }
        
        completionHandler { return recipes }
      } catch {
        completionHandler { throw HelloFreshStoreError.cannotFetch("Cannot fetch recipes") }
      }
    }
  }
  
  func fetchRecipe(_ recipeId: String, completionHandler: @escaping (() throws -> Recipe?) -> Void) {
    privateManagedObjectContext.perform {
      do {
        let fetchRequest = NSFetchRequest<ManagedRecipe>(entityName: "ManagedRecipe")
        fetchRequest.predicate = NSPredicate(format: "recipeId == %@", recipeId)
        let results = try self.privateManagedObjectContext.fetch(fetchRequest)
        if let recipe = results.first?.toRecipe() {
          completionHandler { return recipe }
        } else {
          throw HelloFreshStoreError.cannotFetch("Cannot fetch recipe with id \(recipeId)")
        }
      } catch {
        log.error(error)
        completionHandler { throw HelloFreshStoreError.cannotFetch("Cannot fetch recipe with id \(recipeId)") }
      }
    }
  }
  
  func createRecipe(_ recipeToCreate: Recipe, completionHandler: @escaping (() throws -> Void) -> Void) {
    privateManagedObjectContext.perform {
      do {
        let managedRecipe = NSEntityDescription.insertNewObject(forEntityName: "ManagedRecipe",
                                                                into: self.privateManagedObjectContext) as! ManagedRecipe
        managedRecipe.recipeId = recipeToCreate.recipeId
        managedRecipe.calories = recipeToCreate.calories
        managedRecipe.carbos = recipeToCreate.carbos
        managedRecipe.card = recipeToCreate.card
        managedRecipe.country = recipeToCreate.country
        managedRecipe.deliverableIngredients = recipeToCreate.deliverableIngredients
        managedRecipe.undeliverableIngredients = recipeToCreate.undeliverableIngredients
        managedRecipe.recipeDescription = recipeToCreate.description
        managedRecipe.difficulty = recipeToCreate.difficulty
        managedRecipe.fats = recipeToCreate.fats
        managedRecipe.favorites = recipeToCreate.favorites
        managedRecipe.fibers = recipeToCreate.fibers
        managedRecipe.headline = recipeToCreate.headline
        managedRecipe.highlighted = recipeToCreate.highlighted
        managedRecipe.image = recipeToCreate.image
        managedRecipe.incompatibilities = recipeToCreate.incompatibilities
        managedRecipe.ingredients = recipeToCreate.ingredients
        managedRecipe.keywords = recipeToCreate.keywords
        managedRecipe.name = recipeToCreate.name
        managedRecipe.products = recipeToCreate.products
        managedRecipe.proteins = recipeToCreate.proteins
        managedRecipe.rating = recipeToCreate.rating ?? 0
        managedRecipe.ratings = recipeToCreate.ratings ?? 0
        managedRecipe.thumb = recipeToCreate.thumb
        managedRecipe.time = recipeToCreate.time
        managedRecipe.weeks = recipeToCreate.weeks
        managedRecipe.isFavourite = false
        managedRecipe.currentRating = 0
        
        let managedRecipeUser = NSEntityDescription.insertNewObject(forEntityName: "ManagedRecipeUser",
                                                                into: self.privateManagedObjectContext) as! ManagedRecipeUser
        managedRecipeUser.email = recipeToCreate.user.email
        managedRecipeUser.latlng = recipeToCreate.user.latlng
        managedRecipeUser.name = recipeToCreate.user.name
        
        managedRecipe.recipeUser = managedRecipeUser
        
        // save properties
        try self.privateManagedObjectContext.save()
        completionHandler { return }
      } catch {
        log.error(error)
        completionHandler { throw HelloFreshStoreError.cannotCreate("Cannot create recipe with id \(recipeToCreate.recipeId)") }
      }
    }
  }
  
  func createRecipes(_ recipesToCreate: [Recipe], completionHandler: @escaping (() throws -> Void) -> Void) {
    privateManagedObjectContext.perform {
      do {
        for recipeToCreate in recipesToCreate {
          let managedRecipe = NSEntityDescription.insertNewObject(forEntityName: "ManagedRecipe",
                                                                  into: self.privateManagedObjectContext) as! ManagedRecipe
          managedRecipe.recipeId = recipeToCreate.recipeId
          managedRecipe.calories = recipeToCreate.calories
          managedRecipe.carbos = recipeToCreate.carbos
          managedRecipe.card = recipeToCreate.card
          managedRecipe.country = recipeToCreate.country
          managedRecipe.deliverableIngredients = recipeToCreate.deliverableIngredients
          managedRecipe.undeliverableIngredients = recipeToCreate.undeliverableIngredients
          managedRecipe.recipeDescription = recipeToCreate.description
          managedRecipe.difficulty = recipeToCreate.difficulty
          managedRecipe.fats = recipeToCreate.fats
          managedRecipe.favorites = recipeToCreate.favorites
          managedRecipe.fibers = recipeToCreate.fibers
          managedRecipe.headline = recipeToCreate.headline
          managedRecipe.highlighted = recipeToCreate.highlighted
          managedRecipe.image = recipeToCreate.image
          managedRecipe.incompatibilities = recipeToCreate.incompatibilities
          managedRecipe.ingredients = recipeToCreate.ingredients
          managedRecipe.keywords = recipeToCreate.keywords
          managedRecipe.name = recipeToCreate.name
          managedRecipe.products = recipeToCreate.products
          managedRecipe.proteins = recipeToCreate.proteins
          managedRecipe.rating = recipeToCreate.rating ?? 0
          managedRecipe.ratings = recipeToCreate.ratings ?? 0
          managedRecipe.thumb = recipeToCreate.thumb
          managedRecipe.time = recipeToCreate.time
          managedRecipe.weeks = recipeToCreate.weeks
          managedRecipe.isFavourite = false
          managedRecipe.currentRating = 0
          
          let managedRecipeUser = NSEntityDescription.insertNewObject(forEntityName: "ManagedRecipeUser",
                                                                      into: self.privateManagedObjectContext) as! ManagedRecipeUser
          managedRecipeUser.email = recipeToCreate.user.email
          managedRecipeUser.latlng = recipeToCreate.user.latlng
          managedRecipeUser.name = recipeToCreate.user.name
          
          managedRecipe.recipeUser = managedRecipeUser
          
          // save properties
          try self.privateManagedObjectContext.save()
        }
        completionHandler { return }
      } catch {
        log.error(error)
        completionHandler { throw HelloFreshStoreError.cannotCreate("Cannot create recipes") }
      }
    }
  }
  
  func updateRecipe(_ recipeToUpdate: Recipe, completionHandler: @escaping (_ done: () throws -> Void) -> Void) {
    privateManagedObjectContext.perform {
      do {
        let fetchRequest = NSFetchRequest<ManagedRecipe>(entityName: "ManagedRecipe")
        fetchRequest.predicate = NSPredicate(format: "recipeId == %@", recipeToUpdate.recipeId)
        
        let results = try self.privateManagedObjectContext.fetch(fetchRequest)
        
        if let managedRecipe = results.first {
          do {
            managedRecipe.rating = recipeToUpdate.rating ?? 0
            managedRecipe.isFavourite = recipeToUpdate.isFavourite
            
            try self.privateManagedObjectContext.save()
            
            completionHandler { return }
          } catch {
            completionHandler { throw HelloFreshStoreError.cannotUpdate("Cannot update recipe with id \(recipeToUpdate.recipeId)") }
          }
        }
      } catch {
        completionHandler { throw HelloFreshStoreError.cannotUpdate("Cannot fetch recipe with id \(recipeToUpdate.recipeId) to update") }
      }
    }
  }
}


