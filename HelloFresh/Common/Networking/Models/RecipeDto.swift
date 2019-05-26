//
//  Recipe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation

struct RecipeDto: Codable {
    var id : String
    var calories : String
    var carbos : String
    var card : String
    var country : String
    var deliverableIngredients : [String]
    var undeliverableIngredients : [String]
    var description : String
    var difficulty : Int
    var fats : String
    var favorites : Int
    var fibers : String
    var headline : String
    var highlighted : String
    var image : String
    var incompatibilities : String?
    var ingredients : [String]
    var keywords : [String]
    var name : String?
    var products : [String]
    var proteins : String
    var rating : Int?
    var ratings : Int?
    var thumb : String
    var time : String
    var user : RecipeUser
    var weeks : [String]
    
    // non persistent
    var isFavourite: Bool = false
    var currentRating: Int = 0
}

struct RecipeUser: Codable {
    let email: String
    let latlng: String
    let name: String
}
