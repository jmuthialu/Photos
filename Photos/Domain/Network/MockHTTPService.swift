//
//  MockHTTPService.swift
//  Album
//
//  Created by Jay Muthialu on 10/17/23.
//

import Foundation

struct MockHTTPService: NetworkService {
    
    func getData<T>(urlRequest: URLRequest) async throws -> T? where T : Decodable {
        let data = try loadFromFile(urlRequest: urlRequest)
        let result = try JSONDecoder().decode(T.self, from: data)
        return result
    }
    
    func loadFromFile(urlRequest: URLRequest) throws -> Data {
        
        guard let fileURL = Bundle.main.url(forResource: urlRequest.url?.absoluteString,
                                          withExtension: "") else {
            throw NetworkError.invalidMockFile(urlRequest.url?.absoluteString ?? "")
        }
        
        Logger.log(tag: .network, message: "Loading from file...")
        let data = try Data(contentsOf: fileURL)
        return data
    }
    
}
