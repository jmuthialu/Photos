//
//  URLBuilder.swift
//  Album
//
//  Created by Jay Muthialu on 10/17/23.
//

import Foundation

struct URLBuilder {
 
    struct Constants {
        static let scheme = "https"
        static let host = "jsonplaceholder.typicode.com"
    }
    
    // TODO: Configure default app-wide headers (eg: Authorization)
    func makeRequest(forPath path: String,
                     queryItems: [URLQueryItem]? = nil,
                     headerDict: [String: String]? = nil) -> URLRequest? {
     
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        urlComponents.host = Constants.host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = headerDict
        return urlRequest
    }
    
}
