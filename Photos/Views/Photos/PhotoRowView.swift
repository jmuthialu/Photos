//
//  PhotoRowView.swift
//  Photos
//
//  Created by Jay Muthialu on 10/17/23.
//

import SwiftUI

struct PhotoRowView: View {
    
    let photo: Photo
    
    var body: some View {
        HStack(alignment: .center) {
            
            // TODO: Cache images
            if let thumbnailUrl = photo.thumbnailUrl {
                AsyncImage(url: URL(string: thumbnailUrl)) {  image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
            }
            
            Text(photo.title ?? "No title")
                .padding(.leading, 10)
            
            Spacer()
        }
    }
}

#Preview {
    PhotoRowView(photo: Photo(albumId: 1, 
                              id: 1,
                              title: "Title1",
                              url: "https://via.placeholder.com/600/c757e5",
                              thumbnailUrl: "https://via.placeholder.com/150/c757e5"))
}
