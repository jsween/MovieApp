//
//  OmdbMovieClient.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class OmdbMovieClient {
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
        }.resume()
    }
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        
        
        guard let url = URL.forMovieByImdbId(imdbId) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                print("Error: Decoding Error occurred")
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieDetail))
        }.resume()
    }
}
