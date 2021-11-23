//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8)  {
                AsyncImage(url: URL(string: movieDetailVM.poster)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .cornerRadius(16)
                    } else if phase.error != nil {
                        Image(systemName: "exclamationmark.square")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    } else {
                        ProgressView()
                    }
                }//: AI
                Text(movieDetailVM.title)
                    .font(.title)
                Text(movieDetailVM.plot)
                Text("Directed by: \(movieDetailVM.director)")
                    .fontWeight(.semibold)
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }
                .padding(.top, 8)
                Spacer()
            }//: VStk
            .padding()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieDetailVM: MovieDetailViewModel(movieDetail: MovieDetail(title: "Deadpool", year: "2016", rated: "R", plot: "A romantic comedy about a man named Deadpool saving his woman.", director: "Tim Miller", actors: "Ryan Reynolds", imdbRating: "9.3", poster: "https://m.media-amazon.com/images/M/MV5BYzE5MjY1ZDgtMTkyNC00MTMyLThhMjAtZGI5OTE1NzFlZGJjXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg", imdbId: "tt1431045")))
    }
}
