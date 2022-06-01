//
//  PodcastDetailsViewModel.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation

final class PodcastDetailsViewModel: PodcastItemViewModelProtocol {
    private var podcast: PodcastModel
    
    init(podcast: PodcastModel) {
        self.podcast = podcast
    }
    
    var podcastTitle: String {
        return podcast.trackName ?? ""
    }
    
    var podcastAuthor: String {
        return podcast.artistName ?? ""
    }
    
    var podcastImageURL: String {
        return podcast.artworkUrl100 ?? ""
    }
    
    var podcastReleaseDate: String {
        return podcast.releaseDate?.formatedDate() ?? ""
    }
}
