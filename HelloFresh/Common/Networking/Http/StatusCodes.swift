//
//  StatusCodes.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

enum StatusCodes: Int {
    case ok = 200
    case created = 201
    case accepted = 202
    case baadRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case unprocessable = 422
}
