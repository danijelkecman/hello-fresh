//
//  ExploreRecipesInteractor.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import Alamofire

final class ExploreRecipesInteractor {
}

// MARK: - Extensions -

extension ExploreRecipesInteractor: ExploreRecipesInteractorInterface {
    func getRecipes(completion: @escaping ((Result<[RecipeDto]>, DataResponse<Any>) -> Void)) {
        Alamofire.request(Router.recipes).responseArray { (result: Result<[RecipeDto]>, response: DataResponse<Any>) in
            completion(result, response)
        }
    }
}
