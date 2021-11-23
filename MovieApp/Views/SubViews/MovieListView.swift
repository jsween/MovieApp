//
//  MovieListView.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieViewModel]
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            NavigationLink {
                MovieDetailsScreen(imdbId: movie.imdbId)
            } label: {
                MovieRowView(movie: movie)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: [
            MovieViewModel(movie: Movie(title: "Deadpool", year: "2016", imdbId: "tt1431045", poster: "https://m.media-amazon.com/images/M/MV5BYzE5MjY1ZDgtMTkyNC00MTMyLThhMjAtZGI5OTE1NzFlZGJjXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg")),
            MovieViewModel(movie: Movie(title: "Deadpool 2", year: "2018", imdbId: "tt5463162", poster: "https://m.media-amazon.com/images/M/MV5BMDkzNmRhNTMtZDI4NC00Zjg1LTgxM2QtMjYxZDQ3OWJlMDRlXkEyXkFqcGdeQXVyNTU5MjkzMTU@._V1_SX300.jpg"))
        ])
    }
}
