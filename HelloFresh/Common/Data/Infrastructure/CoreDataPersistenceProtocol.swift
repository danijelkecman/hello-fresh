//
//  CoreDataPersistenceProtocol.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import AlamofireImage

protocol HelloFreshPersistenceProtocol {
  func fetchUser(_ email: String, completionHandler: @escaping (_ user: () throws -> User?) -> Void)
  func createUser(_ userToCreate: User, completionHandler: @escaping (_ done: () throws -> Void) -> Void)
  
  func fetchRecipes(_ completionHandler: @escaping (_ user: () throws -> [Recipe]) -> Void)
  func fetchRecipe(_ recipeId: String, completionHandler: @escaping (_ user: () throws -> Recipe?) -> Void)
  func createRecipe(_ recipeToCreate: Recipe, completionHandler: @escaping (_ done: () throws -> Void) -> Void)
  func createRecipes(_ recipesToCreate: [Recipe], completionHandler: @escaping (_ done: () throws -> Void) -> Void)
  func updateRecipe(_ recipeToUpdate: Recipe, completionHandler: @escaping (_ done: () throws -> Void) -> Void)
}

enum HelloFreshStoreError: Equatable, Error {
  case cannotFetch(String)
  case cannotCreate(String)
  case cannotUpdate(String)
}

func == (lhs: HelloFreshStoreError, rhs: HelloFreshStoreError) -> Bool {
  switch (lhs, rhs) {
  case (.cannotFetch(let a), .cannotFetch(let b)) where a == b: return true
  case (.cannotCreate(let a), .cannotCreate(let b)) where a == b: return true
  default: return false
  }
}


