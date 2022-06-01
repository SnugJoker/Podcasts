//
//  SearchPodcastsModel.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation

struct SearchPodcastsModel: Codable {
    var resultCount: Int?
    var results: [PodcastModel]?
}
