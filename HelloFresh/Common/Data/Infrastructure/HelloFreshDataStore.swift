//
//  HelloFreshDataStore.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import CoreData

class HelloFreshDataStore {
  
  // MARK: - Managed object contexts
  
  var mainManagedObjectContext: NSManagedObjectContext
  var privateManagedObjectContext: NSManagedObjectContext
  
  // MARK: - Object lifecycle
  
  init() {
    
    guard let modelURL = Bundle.main.url(forResource: "HelloFresh", withExtension:"momd") else {
      fatalError("Error loading model from bundle")
    }
    
    guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
      fatalError("Error initializing mom from: \(modelURL)")
    }
    
    let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
    
    mainManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    mainManagedObjectContext.persistentStoreCoordinator = psc
    
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let docURL = urls[urls.endIndex-1]
    
    let storeURL = docURL.appendingPathComponent("HelloFresh.sqlite")
    do {
      try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
    } catch {
      fatalError("Error migrating store: \(error)")
    }
    
    privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
    privateManagedObjectContext.parent = mainManagedObjectContext
    
    
    // Reset Core Data Recipes
    // create the delete request for the specified entity
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedRecipe")
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    
    
    // perform the delete
    do {
      try mainManagedObjectContext.execute(deleteRequest)
    } catch let error as NSError {
      log.error(error)
    }
    
    setupNotificationHandling()
  }
  
  deinit {
    do {
      try self.mainManagedObjectContext.save()
    } catch {
      fatalError("Error deinitializing main managed object context")
    }
  }
  
  // MARK: - Helper Methods
  
  private func setupNotificationHandling() {
    let notificationCenter = NotificationCenter.default
    notificationCenter.addObserver(self, selector: #selector(saveChanges(_:)), name: UIApplication.willTerminateNotification, object: nil)
    notificationCenter.addObserver(self, selector: #selector(saveChanges(_:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
  }
  
  @objc func saveChanges(_ notification: NSNotification) {
    privateManagedObjectContext.perform {
      do {
        if self.privateManagedObjectContext.hasChanges {
          try self.privateManagedObjectContext.save()
        }
      } catch {
        let saveError = error as NSError
        print("Unable to Save Changes of Managed Object Context")
        print("\(saveError), \(saveError.localizedDescription)")
      }
      
      self.mainManagedObjectContext.perform {
        do {
          if self.mainManagedObjectContext.hasChanges {
            try self.mainManagedObjectContext.save()
          }
        } catch {
          let saveError = error as NSError
          print("Unable to Save Changes of Private Managed Object Context")
          print("\(saveError), \(saveError.localizedDescription)")
        }
      }
      
    }
  }
}
