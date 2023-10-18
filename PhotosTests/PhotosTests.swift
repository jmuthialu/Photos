//
//  PhotosTests.swift
//  PhotosTests
//
//  Created by Jay Muthialu on 10/18/23.
//

import XCTest
@testable import Photos

final class PhotosAPITests: XCTestCase {

    func testPhotosAPI() async throws {
        let photosAPI = PhotosAPI(forType: .mock)
    
        let photos = try await photosAPI.getPhotos()
        if let photos = photos {
            Logger.log(tag: .network, message: "Photos count: \(photos.count)")
            XCTAssert(photos.count > 0, "Photos count not greater than 0")
        } else {
            XCTFail("No photos found")
        }
    }


}
