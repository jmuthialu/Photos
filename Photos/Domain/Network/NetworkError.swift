//
//  NetworkError.swift
//  Album
//
//  Created by Jay Muthialu on 10/17/23.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    
    case errorStatusCode
    case incorrectURL
    case invalidMockFile(String)
    
    var description: String {
        switch self {
        case .errorStatusCode:
            return "Failed HTTP status code"
        case .incorrectURL:
            return "Incorrect URL String"
        case let .invalidMockFile (fileName):
            return "Invalid mock file: \(fileName)"
        }
    }
}
