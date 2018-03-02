//
//  LoggerInitializer.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
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
