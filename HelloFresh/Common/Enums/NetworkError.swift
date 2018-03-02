//
//  NetworkError.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Alamofire
import Unbox
import Result
import enum Result.Result

enum NetworkError: Error {
    case General
    case Alamofire(AFError)
    case Unbox(UnboxError)
    
    var message: String {
        switch self {
        case .General:
            return "General error"
        case .Alamofire(let error):
            return "Alamofire error: \(error.localizedDescription)"
        case .Unbox(let error):
            return "Unbox error: \(error.description)"
        }
    }
}

extension NetworkError: ErrorConvertible {
    static func error(from error: Swift.Error) -> NetworkError {
        if error is UnboxError {
            return NetworkError.Unbox(error as! UnboxError)
        } else {
            return NetworkError.Alamofire(error as! AFError)
        }
    }
}

extension UnboxError: ErrorConvertible {
    public static func error(from error: Swift.Error) -> UnboxError {
        return error as! UnboxError
    }
}
