//
//  CoreDataPersistenceProtocol.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import AlamofireImage

protocol HelloFreshPersistenceProtocol {
    func fetchUser(_ email: String, completionHandler: @escaping (_ user: () throws -> User?) -> Void)
    func createUser(_ userToCreate: User, completionHandler: @escaping (_ done: () throws -> Void) -> Void)
    
    func fetchRecipes(completionHandler: @escaping (_ user: () throws -> [Recipe]) -> Void)
    func fetchRecipe(_ recipeId: String, completionHandler: @escaping (_ user: () throws -> Recipe?) -> Void)
    func createRecipe(_ recipeToCreate: Recipe, completionHandler: @escaping (_ done: () throws -> Void) -> Void)
    func updateRecipe(_ recipeToUpdate: Recipe, completionHandler: @escaping (_ done: () throws -> Void) -> Void)
}

extension HelloFreshPersistenceProtocol {
    func fetchUser(_ email: String, completionHandler: @escaping (_ user: () throws -> User?) -> Void) {}
    func createUser(_ userToCreate: User, completionHandler: @escaping (_ done: () throws -> Void) -> Void) {}
    
    func fetchRecipes(completionHandler: @escaping (_ user: () throws -> [Recipe]) -> Void) {}
    func fetchRecipe(_ recipeId: String, completionHandler: @escaping (_ user: () throws -> Recipe?) -> Void) {}
    func createRecipe(_ recipeToCreate: Recipe, completionHandler: @escaping (_ done: () throws -> Void) -> Void) {}
    func updateRecipe(_ recipeToUpdate: Recipe, completionHandler: @escaping (_ done: () throws -> Void) -> Void) {}
}

protocol RecipePersistenceProtocol {
    
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

