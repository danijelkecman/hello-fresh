//
//  ManagedRecipeUser+CoreDataProperties.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 5/26/19.
//  Copyright © 2019 Danijel Kecman. All rights reserved.
//

import Foundation

extension ManagedRecipeUser {
  @NSManaged var email: String
  @NSManaged var latlng: String
  @NSManaged var name: String
}
