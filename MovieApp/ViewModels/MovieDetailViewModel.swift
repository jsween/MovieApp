//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import Foundation

class MovieDetailViewModel: ViewModelBase {
    
    private var movieDetail: MovieDetail?
    private var httpClient = OmdbMovieClient()
    
    init(movieDetail: MovieDetail? = nil) {
        super.init()
        self.loadingState = .loading
        self.movieDetail = movieDetail
    }
    
    func getDetailsBy(imdbId: String) {
        httpClient.getMovieDetailsBy(imdbId: imdbId) { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.movieDetail = details
                    self.loadingState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    var imdbId: String {
        self.movieDetail?.imdbId ?? ""
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var year: String {
        self.movieDetail?.year ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
}
