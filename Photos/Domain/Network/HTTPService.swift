//
//  HTTPService.swift
//  Album
//
//  Created by Jay Muthialu on 10/17/23.
//

import Foundation

struct HTTPService: NetworkService {
    
    var urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func getData<T: Decodable>(urlRequest: URLRequest) async throws -> T? {
        let (data, urlResponse) = try await urlSession.data(for: urlRequest, delegate: nil)
        
        guard let httpResponse = urlResponse as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.errorStatusCode
        }
        
        let results = try JSONDecoder().decode(T.self, from: data)
        return results
    }
}
