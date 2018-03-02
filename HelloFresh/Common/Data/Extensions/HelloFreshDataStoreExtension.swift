//
//  UsersStoreExtension.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
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
    
    func fetchRecipes(_ completionHandler: @escaping (_ profiles: () throws -> [Recipe]) -> Void) {
        privateManagedObjectContext.perform {
            do {
                let fetchRequest = NSFetchRequest<ManagedRecipe>(entityName: "ManagedRecipe")
                let results = try self.privateManagedObjectContext.fetch(fetchRequest)
                let profiles = results.map { $0.toRecipe() }
                
                completionHandler { return profiles }
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
                if let user = results.first?.toRecipe() {
                    completionHandler { return user }
                } else {
                    throw HelloFreshStoreError.cannotFetch("Cannot fetch recipe with id \(recipeId)")
                }
            } catch {
                log.error(error)
                completionHandler { throw HelloFreshStoreError.cannotFetch("Cannot fetch user with id \(recipeId)") }
            }
        }
    }
    
    func createRecipe(_ recipeToCreate: Recipe, completionHandler: @escaping (() throws -> Void) -> Void) {
        privateManagedObjectContext.perform {
            do {
                let managedRecipe = NSEntityDescription.insertNewObject(forEntityName: "ManagedRecipe",
                                                                      into: self.privateManagedObjectContext) as! ManagedRecipe
                managedRecipe.recipeId = recipeToCreate.recipeId
                managedRecipe.recipeRating = recipeToCreate.rating
                managedRecipe.isFavourite = recipeToCreate.isFavourite
                managedRecipe.isFavouriteSet = recipeToCreate.isFavouriteSet
                // save properties
                try self.privateManagedObjectContext.save()
                completionHandler { return }
            } catch {
                log.error(error)
                completionHandler { throw HelloFreshStoreError.cannotCreate("Cannot create recipe with id \(recipeToCreate.recipeId)") }
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
                        managedRecipe.recipeRating = recipeToUpdate.rating
                        managedRecipe.isFavourite = recipeToUpdate.isFavourite
                        managedRecipe.isFavouriteSet = recipeToUpdate.isFavouriteSet
                        
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

