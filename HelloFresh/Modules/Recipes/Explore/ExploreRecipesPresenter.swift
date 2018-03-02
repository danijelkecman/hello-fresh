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
    
    fileprivate var recipesDtos = [RecipeDto]()
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
        _wireframe.navigate(to: .recipeDetails(recipeDto: recipesDtos[indexPath.row]))
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
            case .success(let recipesDtos):
                self?.recipesDtos = recipesDtos
                for recipeDto in recipesDtos {
                    self?._service.createRecipe(Recipe.createRecipeFrom(recipeDto: recipeDto), completionHandler: {
                        print("created frecipe: \(recipeDto)")
                    })
                    self?.recipeItems.append(RecipeCellItem.getItemFrom(recipeDto: recipeDto,
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
            recipeToUpdate.isFavouriteSet = true
            self?._service.updateRecipe(recipeToUpdate, completionHandler: {
                log.info("update success")
                self?.updateRecipeItemWith(recipe: recipeToUpdate)
            })
        }
    }
    
    // Rating changed delegate
    
    func didChangeRatingFor(recipeId: String, with rating: Int) {
        _service.fetchRecipe(recipeId) { [weak self] (recipe) in
            guard let _ = recipe else { return }
            var recipeToUpdate = recipe!
            recipeToUpdate.rating = rating
            self?._service.updateRecipe(recipeToUpdate, completionHandler: {
                log.info("update success")
                self?.updateRecipeItemWith(recipe: recipeToUpdate)
            })
        }
    }
    
    // Did select favourite hold change in memory in recipeItems
    func updateRecipeItemWith(recipe: Recipe) {
        if let i = recipeItems.index(where: { $0.recipeId == recipe.recipeId }) {
            self.recipeItems[i].isFavourite = recipe.isFavourite
            self.recipeItems[i].isFavouriteSet = true
            self.recipeItems[i].rating = recipe.rating
            
            self.recipesDtos[i].isFavourite = recipe.isFavourite
            self.recipesDtos[i].rating = recipe.rating
        }
    }
}














