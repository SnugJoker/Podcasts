//
//  String-Extension.swift
//  Podcasts
//
//  Created by Joseph Razon on 01/06/2022.
//

import Foundation

extension String {
    func formatedDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = dateFormatter.date(from: self) else { return nil}
        
        dateFormatter.dateFormat = "dd-MM-yy"
        
        return dateFormatter.string(from: date)
    }
}
