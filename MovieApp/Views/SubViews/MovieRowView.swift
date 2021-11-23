//
//  MovieRowView.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import SwiftUI

struct MovieRowView: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.poster)) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    Image(systemName: "exclamationmark.square")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                }
            }//: AI
            .frame(width: 100, height: 120)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .foregroundColor(.secondary)
                    .padding(.top, 8)
            }
            .padding()
            Spacer()
        }//: HStk
        .contentShape(Rectangle())
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: MovieViewModel(movie: Movie(title: "DeadPool", year: "2016", imdbId: "tt1431045", poster: "https://m.media-amazon.com/images/M/MV5BYzE5MjY1ZDgtMTkyNC00MTMyLThhMjAtZGI5OTE1NzFlZGJjXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg")))
    }
}
