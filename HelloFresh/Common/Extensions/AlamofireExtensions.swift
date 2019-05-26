//
//  AlamofireExtensions.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Alamofire

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
  
  @discardableResult
  func responseObject<T: Codable>(keyPath: String? = nil,
                                    options: JSONSerialization.ReadingOptions = .allowFragments,
                                    completionHandler: @escaping (Result<T>, DataResponse<Any>) -> Void) -> Self {
    return debugLog()
      .validate()
      .responseJSON(completionHandler: { (response: DataResponse<Any>) in
        response.debugLog()
        
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          guard let data = response.data else {
            completionHandler(.failure(NetworkError.General), response)
            return
          }
          let result = try decoder.decode(T.self, from: data)
          completionHandler(.success(result), response)
        } catch {
          completionHandler(.failure(NetworkError.Decoding(error)), response)
        }
      })
  }
  
  @discardableResult
  func responseArray<T: Codable>(keyPath: String? = nil,
                                   options: JSONSerialization.ReadingOptions = .allowFragments,
                                   completionHandler: @escaping (Result<[T]>, DataResponse<Any>) -> Void) -> Self {
    return debugLog()
      .validate()
      .responseJSON(completionHandler: { (response: DataResponse<Any>) in
        response.debugLog()
        
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          guard let data = response.data else {
            completionHandler(.failure(NetworkError.General), response)
            return
          }
          let result = try decoder.decode([T].self, from: data)
          completionHandler(.success(result), response)
        } catch {
          completionHandler(.failure(NetworkError.Decoding(error)), response)
        }
      })
  }
  
}


