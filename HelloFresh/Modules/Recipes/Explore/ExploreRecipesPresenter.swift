//
//  ExploreRecipesPresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class ExploreRecipesPresenter {
  
  // MARK: - Private properties -
  
  fileprivate weak var _view: ExploreRecipesViewInterface?
  fileprivate var _interactor: ExploreRecipesInteractorInterface
  fileprivate var _wireframe: ExploreRecipesWireframeInterface
  fileprivate var _service: HelloFreshService!
  
  fileprivate var recipeItems = [RecipeCellItem]()
  
  // MARK: - Lifecycle -
  
  init(wireframe: ExploreRecipesWireframeInterface, view: ExploreRecipesViewInterface, interactor: ExploreRecipesInteractorInterface) {
    _wireframe = wireframe
    _view = view
    _interactor = interactor
    
    // otherwise injected data store in test
    _service = HelloFreshService(helloFreshPersistence: HelloFreshDataStore())
  }
  
  func viewDidLoad() {
    log.info("Explore Recipes Presenter viewDidLoad")
    fetchRecipes()
  }
}

// MARK: - Extensions -

extension ExploreRecipesPresenter: ExploreRecipesPresenterInterface {
  // Table View Data Source
  
  func numberOfSections() -> Int {
    return 1
  }
  
  func numberOfItems() -> Int {
    return recipeItems.count
  }
  
  func item(at indexPath: IndexPath) -> RecipeCellItem {
    return recipeItems[indexPath.row]
  }
  
  func didSelectItemAt(indexPath: IndexPath) {
    _wireframe.navigate(to: .recipeDetails(recipeId: recipeItems[indexPath.row].recipeId))
  }
  
  func setItemImage(_ image: UIImage, at row: Int) {
    recipeItems[row].image = image
  }
  
  // API
  
  func fetchRecipes() {
    _view?.showLoading(withMessage: "Loading Recipes")
    _interactor.getRecipes { [weak self] result, response in
      self?._view?.hideLoading()
      switch result {
      case .success(let recipes):
        self?._service.createRecipes(recipes) {
          print("created recipes")
        }
        for recipe in recipes {
          self?.recipeItems.append(RecipeCellItem.getItemFrom(recipe: recipe,
                                                              isFavourite: false,
                                                              isFavouriteSet: false))
        }
        DispatchQueue.main.async {
          self?._view?.reloadTable()
        }
      case .failure(let error):
        log.error(error)
      }
    }
  }
  
  // Storage
  
  func getStoredRecipes() {
    _service.fetchRecipes { recipes in
      log.info(recipes.count)
    }
  }
  
  // Changes should persist on API and called on subsequent screens by recipeId
  // Some offline/online sync could be usefule, or caching, especially for images
  // E.g. no longer than a certain period of time relevant to the order(s), delivery, favourites
  // order habits
  // here caching locally
  
  // MARK: - Recipe Cell Protocols
  
  func didSelectFavouriteWith(recipeId: String, isFavourite: Bool) {
    _service.fetchRecipe(recipeId) { [weak self] (recipe) in
      guard let _ = recipe else { return }
      var recipeToUpdate = recipe!
      recipeToUpdate.isFavourite = isFavourite
      self?._service.updateRecipe(recipeToUpdate) {
        log.info("update success")
        self?.updateRecipeItemWith(recipe: recipeToUpdate)
      }
    }
  }
  
  // Rating changed delegate
  
  func didChangeRatingFor(recipeId: String, with rating: Float) {
    _service.fetchRecipe(recipeId) { [weak self] (recipe) in
      guard let _ = recipe else { return }
      var recipeToUpdate = recipe!
      recipeToUpdate.rating = rating
      self?._service.updateRecipe(recipeToUpdate) {
        log.info("update success")
        self?.updateRecipeItemWith(recipe: recipeToUpdate)
      }
    }
  }
  
  // Did select favourite hold change in memory in recipeItems
  func updateRecipeItemWith(recipe: Recipe) {
    if let i = recipeItems.firstIndex(where: { $0.recipeId == recipe.recipeId }) {
      self.recipeItems[i].isFavourite = recipe.isFavourite
      self.recipeItems[i].rating = recipe.rating
    }
  }
}














