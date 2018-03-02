//
//  ExploreRecipesInteractor.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import Alamofire
import Result
import enum Result.Result

final class ExploreRecipesInteractor {
}

// MARK: - Extensions -

extension ExploreRecipesInteractor: ExploreRecipesInteractorInterface {
    func getRecipes(completion: @escaping ((Result<[RecipeDto], NetworkError>, DataResponse<Any>) -> Void)) {
        Alamofire.request(Router.recipes).responseArray { (result: Result<[RecipeDto], NetworkError>, response: DataResponse<Any>) in
            completion(result, response)
        }
    }
}
