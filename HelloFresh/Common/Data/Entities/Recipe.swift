//
//  Recipe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 26/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

struct Recipe {
  let recipeId: String
  let calories : String
  let carbos : String
  let card : String
  let country : String
  let deliverableIngredients : [String]
  let undeliverableIngredients : [String]
  let description : String
  let difficulty : Int
  let fats : String
  let favorites : Int
  let fibers : String
  let headline : String
  let highlighted : Bool
  let image : String
  let incompatibilities : String?
  let ingredients : [String]
  let keywords : [String]
  let name : String?
  let products : [String]
  let proteins : String
  var rating : Float?
  let ratings : Int?
  let thumb : String
  let time : String
  let user : RecipeUser
  let weeks : [String]
  
  // non codable
  var isFavourite: Bool = false
  var currentRating: Int = 0
}

extension Recipe: Codable {
  enum CodingKeys: String, CodingKey {
    case recipeId = "id"
    case calories
    case carbos
    case card
    case country
    case deliverableIngredients
    case undeliverableIngredients
    case description
    case difficulty
    case fats
    case favorites
    case fibers
    case headline
    case highlighted
    case image
    case incompatibilities
    case ingredients
    case keywords
    case name
    case products
    case proteins
    case rating
    case ratings
    case thumb
    case time
    case user
    case weeks
  }
}

struct RecipeUser: Codable {
  let email: String
  let latlng: String
  let name: String
}
