//
//  ExploreRecipesPresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
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
    _wireframe.navigate(to: .recipeDetails(service: _service, recipeId: recipeItems[indexPath.row].recipeId))
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
          self?.recipeItems.append(RecipeCellItem.getItemFrom(recipe: recipe, isFavourite: false))
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
    recipeItems.removeAll()
    _service.fetchRecipes { [weak self] recipes in
      for recipe in recipes {
        self?.recipeItems.append(RecipeCellItem.getItemFrom(recipe: recipe, isFavourite: recipe.isFavourite))
      }
      DispatchQueue.main.async {
        self?._view?.reloadTable()
      }
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
      guard var recipe = recipe else { return }
      recipe.isFavourite = isFavourite
      self?._service.updateRecipe(recipe) {
        log.info("update success")
        self?.updateRecipeItemWith(recipe: recipe)
      }
    }
  }
  
  // Rating changed delegate
  
  func didChangeRatingFor(recipeId: String, with rating: Float) {
    _service.fetchRecipe(recipeId) { [weak self] (recipe) in
      guard var recipe = recipe else { return }
      recipe.rating = rating
      self?._service.updateRecipe(recipe) {
        log.info("update success")
        self?.updateRecipeItemWith(recipe: recipe)
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














