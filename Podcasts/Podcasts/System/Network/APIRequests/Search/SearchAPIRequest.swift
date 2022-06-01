//
//  SearchAPIRequest.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation

class SearchAPIRequest: APIRequestProtocol {
    var urlString: String = "https://itunes.apple.com/search?term=%@&entity=podcast"
    
    func searchPodcasts(_ searchTerm: String, completion: @escaping (Result<SearchPodcastsModel?, Error>) -> Void) {
        // I would use constants instead of those "magic strings".
        var allowedQueryParamAndKey = NSCharacterSet.urlQueryAllowed
        allowedQueryParamAndKey.remove(charactersIn: ";/?:@&=+$, ")

        let editedURLString = urlString.replacingOccurrences(of: "term=%@", with: "term=\(searchTerm)").replacingOccurrences(of: " ", with: "%20")
        
        guard let url = URL(string: editedURLString) else {
            print("url == nil")
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil,
                  let data = data
            else {
                completion(.failure(error!))
                
                return
            }
            
            let searchPodcastsModel = try? JSONDecoder().decode(SearchPodcastsModel.self, from: data)
            completion(.success(searchPodcastsModel))
            
        }.resume()
    }
}
