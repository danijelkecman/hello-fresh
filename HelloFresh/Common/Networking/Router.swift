//
//  Router.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    // food2fork api: 549c225a094207158b18f0ee52e36391
    // http://food2fork.com/api/search
    // http://food2fork.com/api/get
    fileprivate static let _baseURL = URL(string: "https://api.myjson.com/bins/tn53l")!
    fileprivate static let _loginURL = URL(string: "http://localhost:8080")!
    
    case login(username: String, password: String)
    case register(username: String, password: String)
    case recipes
    
    fileprivate var method: HTTPMethod {
        switch self {
        case .login(_,_), .recipes:
            return .get
        case .register(_,_):
            return .post
        }
    }
    
    fileprivate var path: String {
        switch self {
        case .register:
            return "/users"
        case .login:
            return "/"
        case .recipes:
            return ""
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = Router._baseURL
        let loginUrl = Router._loginURL
        
        var urlRequest: URLRequest!
        
        switch self {
        case .login(_,_):
            urlRequest = URLRequest(url: loginUrl.appendingPathComponent(path))
        default:
            urlRequest = URLRequest(url: url.appendingPathComponent(path))
        }
        urlRequest.httpMethod = method.rawValue
                
        // Parameters
        
        switch self {
        case let .login(username, password):
            let authorisation = getRequestHttpHeaders(username: username, password: password)
            urlRequest.allHTTPHeaderFields = authorisation
        case let .register(username, password):
            log.info("register username: \(username), password: \(password)")
            break
        case .recipes:
            log.info("getting recipes")
            break
        }
        
        return urlRequest
    }
    
    func getRequestHttpHeaders(username: String, password: String) -> HTTPHeaders {
        let authTuple: (key: String, value: String)? = Request.authorizationHeader(user: username, password: password)
        return [authTuple!.key : authTuple!.value]
    }
    
}
