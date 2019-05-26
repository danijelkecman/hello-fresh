//
//  UserServices.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

class HelloFreshService {
  var helloFreshPersistence: HelloFreshPersistenceProtocol
  
  init(helloFreshPersistence: HelloFreshPersistenceProtocol) {
    self.helloFreshPersistence = helloFreshPersistence
  }
  
  func fetchUser(_ id: String, completionHandler: @escaping (_ user: User?) -> Void) {
    helloFreshPersistence.fetchUser(id) { (user: () throws -> User?) -> Void in
      do {
        let user = try user()
        completionHandler(user)
      } catch {
        completionHandler(nil)
      }
    }
  }
  
  func createUser(_ userToCreate: User, completionHandler: @escaping () -> Void) {
    helloFreshPersistence.createUser(userToCreate) { (done: () throws -> Void) -> Void  in
      do {
        try done()
        completionHandler()
      } catch {
        completionHandler()
      }
    }
    
  }
  
  func fetchRecipes(_ completionHandler: @escaping (_ profiles: [Recipe]) -> Void) {
    helloFreshPersistence.fetchRecipes { (recipes: () throws -> [Recipe]) -> Void in
      do {
        let recipes = try recipes()
        completionHandler(recipes)
      } catch {
        completionHandler([])
      }
    }
  }
  
  
  func fetchRecipe(_ recipeId: String, completionHandler: @escaping (_ recipe: Recipe?) -> Void) {
    helloFreshPersistence.fetchRecipe(recipeId) { (recipe: () throws -> Recipe?) -> Void in
      do {
        let recipe = try recipe()
        completionHandler(recipe)
      } catch {
        log.error(error)
        completionHandler(nil)
      }
    }
  }
  
  func createRecipe(_ recipeToCreate: Recipe, completionHandler: @escaping () -> Void) {
    helloFreshPersistence.createRecipe(recipeToCreate) { (done: () throws -> Void) -> Void  in
      do {
        try done()
        completionHandler()
      } catch {
        log.error(error)
        completionHandler()
      }
    }
    
  }
  
  func createRecipes(_ recipesToCreate: [Recipe], completionHandler: @escaping () -> Void) {
    helloFreshPersistence.createRecipes(recipesToCreate) { (done: () throws -> Void) -> Void  in
      do {
        try done()
        completionHandler()
      } catch {
        log.error(error)
        completionHandler()
      }
    }
    
  }
  
  func updateRecipe(_ recipeToUpdate: Recipe, completionHandler: @escaping () -> Void) {
    helloFreshPersistence.updateRecipe(recipeToUpdate) { (done: () throws -> Void) -> Void  in
      do {
        try done()
        completionHandler()
      } catch {
        log.error(error)
        completionHandler()
      }
    }
    
  }
  
}

