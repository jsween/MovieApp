//
//  URL+Extensions.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import Foundation
extension URL {
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "\(K.OMDB_BASE_URL_SECURE)/?s=\(name)&apikey=\(K.API_KEY)")
    }
    
    static func forMovieByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "\(K.OMDB_BASE_URL_SECURE)/?i=\(imdbId)&apiKey=\(K.API_KEY)")
    }
}
