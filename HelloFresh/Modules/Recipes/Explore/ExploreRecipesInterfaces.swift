//
//  ExploreRecipesInterfaces.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import Alamofire

enum ExploreRecipesNavigationOption {
    case recipeDetails(recipeId: String)
}

protocol ExploreRecipesWireframeInterface: WireframeInterface {
    func navigate(to option: ExploreRecipesNavigationOption)
}

protocol ExploreRecipesViewInterface: ViewInterface, Progressable {
    func reloadTable()
}

protocol ExploreRecipesPresenterInterface: PresenterInterface {
    // Api
    func fetchRecipes()
    // Storage
    func getStoredRecipes()
    // Table Data Source
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func item(at indexPath: IndexPath) -> RecipeCellItem
    func didSelectItemAt(indexPath: IndexPath)
    func setItemImage(_ image: UIImage, at row: Int)
    // Recipe Cell Protocols
    func didSelectFavouriteWith(recipeId: String, isFavourite: Bool)
    func didChangeRatingFor(recipeId: String, with rating: Float)
}

protocol ExploreRecipesInteractorInterface: InteractorInterface {
    func getRecipes(completion: @escaping ((Result<[Recipe]>, DataResponse<Any>) -> Void))
}
