//
//  Photo.swift
//  Photo
//
//  Created by Jay Muthialu on 10/17/23.
//

import Foundation

struct Photo: Decodable, Hashable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
}
