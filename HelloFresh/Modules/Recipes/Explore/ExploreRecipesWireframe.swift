//
//  ExploreRecipesWireframe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class ExploreRecipesWireframe: BaseWireframe {
  
  // MARK: - Private properties -
  
  private let _storyboard = AppStoryboard.Onboarding.instance
  
  // MARK: - Module setup -
  
  func configureModule(with viewController: ExploreRecipesViewController) {
    let interactor = ExploreRecipesInteractor()
    let presenter = ExploreRecipesPresenter(wireframe: self, view: viewController, interactor: interactor)
    viewController.presenter = presenter
    viewController.configureTabBarItem()
  }
  
  // MARK: - Transitions -
  
  func show(with transition: Transition, animated: Bool = true) {
    let moduleViewController = ExploreRecipesViewController.instantiateFrom(appStoryboard: .Recipes)
    configureModule(with: moduleViewController)
    
    show(moduleViewController, with: transition, animated: animated)
  }
  
  func _navigateToRecipeDetailsWith(service: HelloFreshService, recipeId: String) {
    let wireframe = RecipeDetailsWireframe(navigationController: self.navigationController)
    wireframe.show(with: .push, service: service, recipeId: recipeId)
  }
}

// MARK: - Extensions -

extension ExploreRecipesWireframe: ExploreRecipesWireframeInterface {
  
  func navigate(to option: ExploreRecipesNavigationOption) {
    switch option {
    case .recipeDetails(let service, let recipeId):
      _navigateToRecipeDetailsWith(service: service, recipeId: recipeId)
    }
  }
}

