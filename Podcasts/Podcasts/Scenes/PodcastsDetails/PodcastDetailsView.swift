//
//  PodcastDetailsView.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation
import SwiftUI

struct PodcastDetailsView: View {
    @ObservedObject private var viewModel: PodcastDetailsViewModel
    
    init(viewModel: PodcastDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        createMainView()
    }
}

// MARK: Private View Creators
extension PodcastDetailsView {
    private func createMainView() -> some View {
        NavigationView {
            VStack {
                createImageView()
                    .padding()
                createDetailsView()
                    .padding(.horizontal)
                
                Spacer()
            }
        }
    }
    
    private func createImageView() -> some View {
        AsyncImage(url: URL(string: viewModel.podcastImageURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .podcastItemModifier()
                
            case .failure:
                Image(systemName: "photo")
                    .podcastItemModifier()
            @unknown default:
                EmptyView()
            }
        }
    }
    
    private func createDetailsView() -> some View {
        VStack() {
            Text(viewModel.podcastTitle)
                .padding(.bottom, 4)
            Text(viewModel.podcastAuthor)
                .padding(.bottom, 4)
            Text(viewModel.podcastReleaseDate)
                .padding(.bottom, 4)
        }
    }
}
