//
//  Logger.swift
//  Album
//
//  Created by Jay Muthialu on 10/17/23.
//

import Foundation

struct Logger {
    
    enum Tag: String {
        case network
        case photosList
    }
    
    enum Level: String {
        case info
        case warn
        case error
        
    }
    
    static func log(tag: Tag, level: Level = .info, message: String) {
        #if DEBUG
        print(tag.rawValue + ": " + level.rawValue + ": " + message)
        #endif
    }
    
}
