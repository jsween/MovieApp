//
//  MovieDetailsScreen.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            if movieDetailVM.loadingState == .loading {
                ProgressView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if movieDetailVM.loadingState == .failed {
                FailedMovieView()
            }
        }
        .onAppear() {
            self.movieDetailVM.getDetailsBy(imdbId: self.imdbId)
        }
    }
}

struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreen(imdbId: "tt3896198")
    }
}
