//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/19/21.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListViewModel // Any views using this will be re-rendered on change
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $movieName, onEditingChanged: { _ in }) {
                    self.movieListVM.searchBy(self.movieName)
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()

                if self.movieListVM.loadingState == .success {
                    MovieListView(movies: movieListVM.movies)
                } else if self.movieListVM.loadingState == .failed {
                    FailedMovieView()
                    Spacer(minLength: 350)
                } else if self.movieListVM.loadingState == .loading {
                    ProgressView()
                    Spacer(minLength: 350)
                }

            }
            .navigationTitle("Movies")
        }
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
