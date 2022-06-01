//
//  PodcastItemView.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation
import SwiftUI

struct PodcastItemView: View {
    @ObservedObject private var viewModel: PodcastItemViewModel
    
    init(viewModel: PodcastItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        createMainView()
    }
}

// MARK: Private View Creators
extension PodcastItemView {
    private func createMainView() -> some View {
        HStack() {
            createImageView()
            createDetailsView()
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
            HStack {
                Text(viewModel.podcastTitle)
                Spacer()
            }
            
            Spacer()
            
            
            HStack {
                Text(viewModel.podcastAuthor)
                Spacer()
            }
        }
    }
}
