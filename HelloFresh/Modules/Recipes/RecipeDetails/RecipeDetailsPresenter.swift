//
//  RecipeDetailsPresenter.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 26/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class RecipeDetailsPresenter {
  
  // MARK: - Private properties -
  
  fileprivate weak var _view: RecipeDetailsViewInterface?
  fileprivate var _interactor: RecipeDetailsInteractorInterface
  fileprivate var _wireframe: RecipeDetailsWireframeInterface
  
  fileprivate var _service: HelloFreshService!
  fileprivate var _recipeId: String!
  fileprivate var _recipe: Recipe?
  
  // MARK: - Lifecycle -
  
  init(wireframe: RecipeDetailsWireframeInterface,
       view: RecipeDetailsViewInterface,
       interactor: RecipeDetailsInteractorInterface,
       service: HelloFreshService,
       recipeId: String) {
    _wireframe = wireframe
    _view = view
    _interactor = interactor
    
    _service = service
    _recipeId = recipeId
  }
  
  func viewDidLoad() {
    _service.fetchRecipe(_recipeId) { recipe in
      self._recipe = recipe
      self.reloadTableData()
    }
  }
  
  func reloadTableData() {
    DispatchQueue.main.async {
      self._view?.reloadData()
    }
  }
}

// MARK: - Extensions -

extension RecipeDetailsPresenter: RecipeDetailsPresenterInterface {
  
  func didChangeRatingFor(with rating: Float) {
    guard var recipe = _recipe else { return }
    recipe.rating = Float(rating)
    updateRecipe(with: recipe)
  }
  func updateRecipe(with recipe: Recipe) {
    _service.updateRecipe(recipe) {
      self._recipe = recipe
    }
  }
  
  func getRecipe() -> Recipe? {
    return _recipe
  }
}

