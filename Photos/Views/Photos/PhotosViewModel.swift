//
//  PhotosViewModel.swift
//  Photos
//
//  Created by Jay Muthialu on 10/17/23.
//

import Foundation

class PhotosViewModel: ObservableObject {
    
    @Published var photos: [Photo]?
    let photosAPI = PhotosAPI()
    
    @MainActor
    func getPhotos() {
        Task {
            do {
                photos = try await photosAPI.getPhotos()
            } catch {
                Logger.log(tag: .photosList, message: "Error")
            }
        }
    }
}
