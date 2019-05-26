//
//  NetworkError.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Alamofire

enum NetworkError: Error {
  case General
  case Decoding(Error)
  case Alamofire(AFError)
  
  var message: String {
    switch self {
    case .General:
      return "General error"
    case .Decoding(let error):
      return "Decoding error: \(error.localizedDescription)"
    case .Alamofire(let error):
      return "Alamofire error: \(error.localizedDescription)"
    }
  }
}

