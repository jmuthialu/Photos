//
//  PhotosView.swift
//  Album
//
//  Created by Jay Muthialu on 10/17/23.
//

import SwiftUI

struct PhotosView: View {
    
    @ObservedObject var viewModel = PhotosViewModel()
    
    var body: some View {
        // TODO: Replace with NavStack. Consider coordinator patter for navigation
        NavigationView {
            List {
                ForEach(viewModel.photos ?? [], id: \.id) { photo in
                    NavigationLink(destination: PhotoDetailView(photo: photo)) {
                        PhotoRowView(photo: photo)
                    }
                }
            }
            .navigationTitle("Photos")
            .refreshable { viewModel.getPhotos() }
            .onAppear { viewModel.getPhotos() }
        }
    
    }
}

#Preview {
    PhotosView()
}
