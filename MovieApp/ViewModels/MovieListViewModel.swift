//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import Foundation
 
class MovieListViewModel: ViewModelBase {
    @Published var movies = [MovieViewModel]() // Tells views to re-render when updated or changed
    
    let httpClient = OmdbMovieClient()
    
    func searchBy(_ name: String) {
        
        if name.isEmpty {
            return
        }
        self.loadingState = .loading
        // Lord of the Rings
        // Lord%20of%20the%20Rings.trim()
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init) // Going through each Movie Model and using Movie.values to create/initialize MovieViewModels
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie: Movie
    
    var imdbId: String {
        movie.imdbId
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}
