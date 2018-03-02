//
//  Recipe.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation
import Unbox

struct RecipeDto {
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

extension RecipeDto: Unboxable {
    init(unboxer: Unboxer) throws {
        self.calories = try unboxer.unbox(key: "calories")
        self.carbos = try unboxer.unbox(key: "carbos")
        self.card = try unboxer.unbox(key: "card")
        self.country = try unboxer.unbox(key: "country")
        self.deliverableIngredients = try unboxer.unbox(key: "deliverable_ingredients")
        self.description = try unboxer.unbox(key: "description")
        self.difficulty = try unboxer.unbox(key: "difficulty")
        self.fats = try unboxer.unbox(key: "fats")
        self.favorites = try unboxer.unbox(key: "favorites")
        self.fibers = try unboxer.unbox(key: "fibers")
        self.headline = try unboxer.unbox(key: "headline")
        self.highlighted = try unboxer.unbox(key: "highlighted")
        self.id = try unboxer.unbox(key: "id")
        self.image = try unboxer.unbox(key: "image")
        self.incompatibilities = unboxer.unbox(key: "incompatibilities")
        self.ingredients = try unboxer.unbox(key: "ingredients")
        self.keywords = try unboxer.unbox(key: "keywords")
        self.name = unboxer.unbox(key: "name")
        self.products = try unboxer.unbox(key: "products")
        self.proteins = try unboxer.unbox(key: "proteins")
        self.rating = unboxer.unbox(key: "rating")
        self.ratings = unboxer.unbox(key: "ratings")
        self.thumb = try unboxer.unbox(key: "thumb")
        self.time = try unboxer.unbox(key: "time")
        self.undeliverableIngredients = try unboxer.unbox(key: "undeliverable_ingredients")
        self.user = try unboxer.unbox(key: "user")
        self.weeks = try unboxer.unbox(key: "weeks")
    }
}

struct RecipeUser {
    let email: String
    let latlng: String
    let name: String
}

extension RecipeUser: Unboxable {
    init(unboxer: Unboxer) throws {
        self.email = try unboxer.unbox(key: "email")
        self.latlng = try unboxer.unbox(key: "latlng")
        self.name = try unboxer.unbox(key: "name")
    }
}


















