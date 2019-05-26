////
////  Recipe.swift
////  HelloFresh
////
////  Created by Danijel Kecman on 26/5/19.
////  Copyright © 2017 Danijel Kecman. All rights reserved.
////
//
//import Foundation
//
//struct RecipeDto {
//    var id : String
//    var calories : String
//    var carbos : String
//    var card : String
//    var country : String
//    var deliverableIngredients : [String]
//    var undeliverableIngredients : [String]
//    var description : String
//    var difficulty : Int
//    var fats : String
//    var favorites : Int
//    var fibers : String
//    var headline : String
//    var highlighted : Bool
//    var image : String
//    var incompatibilities : String?
//    var ingredients : [String]
//    var keywords : [String]
//    var name : String?
//    var products : [String]
//    var proteins : String
//    var rating : Float?
//    var ratings : Int?
//    var thumb : String
//    var time : String
//    var user : RecipeUser
//    var weeks : [String]
//    
//    // non persistent
//    var isFavourite: Bool = false
//    var currentRating: Int = 0
//}
//
//extension RecipeDto: Codable {
//  enum CodingKeys: String, CodingKey {
//    case id
//    case calories
//    case carbos
//    case card
//    case country
//    case deliverableIngredients
//    case undeliverableIngredients
//    case description
//    case difficulty
//    case fats
//    case favorites
//    case fibers
//    case headline
//    case highlighted
//    case image
//    case incompatibilities
//    case ingredients
//    case keywords
//    case name
//    case products
//    case proteins
//    case rating
//    case ratings
//    case thumb
//    case time
//    case user
//    case weeks
//  }
//}
//
//struct RecipeUser: Codable {
//    let email: String
//    let latlng: String
//    let name: String
//}
