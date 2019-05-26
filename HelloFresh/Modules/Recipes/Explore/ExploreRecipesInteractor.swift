//
//  ExploreRecipesInteractor.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import Alamofire

final class ExploreRecipesInteractor {
}

// MARK: - Extensions -

extension ExploreRecipesInteractor: ExploreRecipesInteractorInterface {
    func getRecipes(completion: @escaping ((Result<[Recipe]>, DataResponse<Any>) -> Void)) {
        Alamofire.request(Router.recipes).responseArray { (result: Result<[Recipe]>, response: DataResponse<Any>) in
            completion(result, response)
        }
    }
}
