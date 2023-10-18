//
//  PhotoDetailView.swift
//  Photos
//
//  Created by Jay Muthialu on 10/17/23.
//

import SwiftUI

struct PhotoDetailView: View {
    
    let photo: Photo
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Text(photo.title ?? "No Title")
                .padding(.bottom, 20)
            
            if let url = photo.url {
                AsyncImage(url: URL(string: url)) {  image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 220, height: 200)
            }
        }
        .padding()
    }
}

#Preview {
    PhotoDetailView(photo: Photo(albumId: 1,
                                 id: 1,
                                 title: "Title1",
                                 url: "https://via.placeholder.com/600/c757e5",
                                 thumbnailUrl: "https://via.placeholder.com/150/c757e5"))
}
