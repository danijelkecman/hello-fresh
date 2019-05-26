//
//  LoggerInitializer.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Foundation
import SwiftyBeaver

final class LoggerInitializer: Initializable {
    
    func initialize() {
        let console = ConsoleDestination()
        log.addDestination(console)
    }
    
}
