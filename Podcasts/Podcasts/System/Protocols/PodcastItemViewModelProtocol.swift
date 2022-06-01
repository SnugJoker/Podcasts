//
//  PodcastItemViewModelProtocol.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation

protocol PodcastItemViewModelProtocol: ObservableObject {
    init(podcast: PodcastModel)
    
    var podcastTitle: String { get }
    var podcastAuthor: String { get }
    var podcastImageURL: String { get }
}
