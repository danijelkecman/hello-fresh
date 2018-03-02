//
//  ManagedUser.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/10/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import CoreData

class ManagedUser: NSManagedObject {
    func toUser() -> User {
        return User(username: username, name: name, email: email, password: password)
    }
}
