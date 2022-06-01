//
//  PodcastsListViewModel.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation

final class PodcastsListViewModel: ObservableObject {
    @Published var searchTerm = "" {
        didSet {
            searchPodcasts(self.searchTerm)
        }
    }

    @Published var shouldShowLoader = false
    @Published var podcastsItems = [PodcastModel]()
    
    var screenTitle: String {
        return "Podcasts List"
    }
}

// MARK: Public Methods
extension PodcastsListViewModel {
    func searchPodcasts(_ term: String) {
        self.shouldShowLoader = true
        
        let search = SearchAPIRequest()
        search.searchPodcasts(term) { [weak self] result in
            guard let self = self else { return }
            
            self.shouldShowLoader = false
            
            switch result {
            case .success(let podcastsList):
                guard let podcasts = podcastsList?.results else {
                    self.podcastsItems = [PodcastModel]()
                    
                    return
                }
                
                self.podcastsItems = podcasts
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func podcastItemViewModel(_ forIndex: Int) -> PodcastItemViewModel {
        // extension for array to return optional
        let podcastItem = podcastsItems[forIndex]
        return PodcastItemViewModel(podcast: podcastItem)
    }
    
    func podcastDetailsViewModel(_ forIndex: Int) -> PodcastDetailsViewModel {
        // extension for array to return optional
        let podcastItem = podcastsItems[forIndex]
        return PodcastDetailsViewModel(podcast: podcastItem)
    }
}
