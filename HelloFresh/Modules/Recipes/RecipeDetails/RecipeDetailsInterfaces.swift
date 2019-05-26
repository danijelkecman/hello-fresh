//
//  RecipeDetailsInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum RecipeDetailsNavigationOption {
}

protocol RecipeDetailsWireframeInterface: WireframeInterface {
    func navigate(to option: RecipeDetailsNavigationOption)
}

protocol RecipeDetailsViewInterface: ViewInterface {
}

protocol RecipeDetailsPresenterInterface: PresenterInterface {
    func getRecipe() -> Recipe
    func updateRecipe(with recipe: Recipe)
    func didChangeRatingFor(with rating: Float)
}

protocol RecipeDetailsInteractorInterface: InteractorInterface {
}
