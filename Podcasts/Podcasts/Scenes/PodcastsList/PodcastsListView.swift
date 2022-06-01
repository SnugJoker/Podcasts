//
//  PodcastsListView.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation
import SwiftUI

struct PodcastsListView: View {
    @StateObject private var viewModel = PodcastsListViewModel()
    
    var body: some View {
        createMainView()
    }
}

// MARK: Private View Creators
extension PodcastsListView {
    private func createMainView() -> some View {
        NavigationView {
            ZStack {
                if viewModel.shouldShowLoader {
                    ProgressView()
                }
                
                VStack {
                    TextField("Search for podcasts...", text: $viewModel.searchTerm)
                        .padding()
                    
                    List {
                        ForEach(0..<viewModel.podcastsItems.count, id: \.self) { index in
                            NavigationLink(destination: PodcastDetailsView(viewModel: viewModel.podcastDetailsViewModel(index))) {
                                PodcastItemView(viewModel: viewModel.podcastItemViewModel(index))
                                    .padding(.bottom)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .navigationBarTitle( Text(viewModel.screenTitle) )
            }
        }
    }
}

struct PodcastsListView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastsListView()
    }
}
