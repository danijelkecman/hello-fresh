//
//  AlamofireExtensions.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Alamofire
import Unbox
import Result
import enum Result.Result

// MARK: - Logging -

extension DataRequest {
    
    public func debugLog() -> Self {
        let logString = "===== 🚀 REQUEST 🚀 =====" + "\n" + debugDescription
        log.verbose(logString)
        return self
    }
    
}

extension DataResponse {
    public func debugLog() {
        var logString = "===== ✨ RESPONSE ✨ =====" + "\n\n"
        
        guard let data = data, let jsonString = String(data: data, encoding: String.Encoding.utf8) else {
            logString += "🔴 ERROR: " + "\n" + "\(debugDescription)" + "\n"
            log.error(logString)
            return
        }
        
        logString += "🔷 RESPONSE:" + "\n" + "\(debugDescription)" + "\n\n"
        
        switch result {
        case .success(let value):
            logString += jsonString + "\n\n"
            logString += "🔶 SUCCESSFULLY DESERIALIZED: " + "\n" + String(describing: type(of: value)) + "\n\n"
            log.verbose(logString)
        case .failure(let error):
            logString += jsonString + "\n"
            logString += "🔴 ERROR: " + "\n" + "\(error)" + "\n\n"
            log.error(logString)
        }
    }
}

// MARK: - Convenience -

extension DataRequest {
    
    @discardableResult func responseObject<T: Unboxable>(keyPath: String? = nil, options: JSONSerialization.ReadingOptions = .allowFragments, completionHandler: @escaping (Result<T, NetworkError>, DataResponse<Any>) -> Void) -> Self {
        return debugLog()
            .validate()
            .responseJSON(completionHandler: { (response: DataResponse<Any>) in
                response.debugLog()
                
                let result = response
                    .result
                    .mapError { NetworkError.Alamofire($0) }
                    .flatMap({ anyObject -> Result<UnboxableDictionary, NetworkError> in
                        let jsonCandidate: Any?
                        if let keyPath = keyPath, !keyPath.isEmpty {
                            jsonCandidate = (anyObject as AnyObject?)?.value(forKeyPath: keyPath)
                        } else {
                            jsonCandidate = anyObject
                        }
                        
                        guard let dictionary = jsonCandidate as? UnboxableDictionary else {
                            return .failure(NetworkError.General)
                        }
                        
                        return .success(dictionary)
                    })
                    .tryMap { try unbox(dictionary: $0) as T }
                
                completionHandler(result, response)
            })
    }
    
    @discardableResult func responseArray<T: Unboxable>(keyPath: String? = nil, options: JSONSerialization.ReadingOptions = .allowFragments, completionHandler: @escaping (Result<[T], NetworkError>, DataResponse<Any>) -> Void) -> Self {
        return debugLog()
            .validate()
            .responseJSON(completionHandler: { (response: DataResponse<Any>) in
                response.debugLog()
                
                let result = response.result
                    .mapError { NetworkError.Alamofire($0) }
                    .flatMap({ anyObject -> Result<[UnboxableDictionary], NetworkError> in
                        let jsonCandidate: Any?
                        if let keyPath = keyPath, !keyPath.isEmpty {
                            jsonCandidate = (anyObject as AnyObject?)?.value(forKeyPath: keyPath)
                        } else {
                            jsonCandidate = anyObject
                        }
                        
                        guard let array = jsonCandidate as? [UnboxableDictionary] else {
                            return .failure(NetworkError.General)
                        }
                        
                        return .success(array)
                    })
                    .tryMap { try mapObjects(from: $0) as [T] }
                
                completionHandler(result, response)
            })
    }
    
}

extension Alamofire.Result: ResultProtocol {
    
    public init(value: Value) {
        self = .success(value)
    }
    
    public init(error: AFError) {
        self = .failure(error)
    }
    
    public func analysis<Result>(ifSuccess: (Value) -> Result, ifFailure: (AFError) -> Result) -> Result {
        switch self {
        case let .success(value):
            return ifSuccess(value)
        case let .failure(value):
            return ifFailure(value as! AFError)
        }
    }
    
}

// MARK: - Helpers -

private func mapObjects<T: Unboxable>(from objects: [UnboxableDictionary]) throws -> [T] {
    
    return try objects.reduce([T]()) { container, rawValue in
        let value = try unbox(dictionary: rawValue) as T
        return container + [value]
    }
    
}
