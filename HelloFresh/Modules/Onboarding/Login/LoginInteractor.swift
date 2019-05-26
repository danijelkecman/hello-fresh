//
//  LoginInteractor.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import Alamofire

final class LoginInteractor {
}

// MARK: - Extensions -

extension LoginInteractor: LoginInteractorInterface {
    func loginUserWith(username: String, password: String, completion: @escaping ((Result<Bool>) -> Void)) {
        Alamofire.request(Router.login(username: username, password: password)).validate().responseData { response in
            response.debugLog()
            switch response.result {
            case .success(_):
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
