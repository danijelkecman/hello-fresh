//
//  ManagedUser+CoreDataProperties.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import CoreData

extension ManagedUser {
    @NSManaged var username: String
    @NSManaged var name: String
    @NSManaged var email: String
    @NSManaged var password: String
}

