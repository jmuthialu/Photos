//
//  PhotosAPI.swift
//  Album
//
//  Created by Jay Muthialu on 10/17/23.
//

import Foundation

class PhotosAPI {
    
    struct Constants {
        static let photosHttpPath = "/albums/5/photos"
        static let photosMockFile = "Photos.json"
    }
    
    private let networkService: NetworkService?
    
    init(forType serviceType: NetworkFactory.ServiceType = .http,
         urlSession: URLSession = URLSession.shared) {
        
        networkService = NetworkFactory.getService(forType: serviceType,
                                                   urlSession: urlSession)
    }
    
    func getPhotos() async throws -> [Photo]? {
        guard let urlRequest = try buildURLRequest(forPath: Constants.photosHttpPath) else { throw NetworkError.incorrectURL}
        let photos: [Photo]? = try await networkService?.getData(urlRequest: urlRequest)
        return photos
    }
    
    private func buildURLRequest(forPath path: String) throws -> URLRequest? {
        if networkService is HTTPService {
            return URLBuilder().makeRequest(forPath: path)
        } else {
            guard let url = URL(string: Constants.photosMockFile) else {
                throw NetworkError.incorrectURL
            }
            return URLRequest(url: url)
        }
    }
}
