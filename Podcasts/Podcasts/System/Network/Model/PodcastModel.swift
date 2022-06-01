//
//  PodcastModel.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation

struct PodcastModel: Codable {
    var artistName: String?
    var trackName: String?
    var artworkUrl100: String?
    var releaseDate: String?
}
