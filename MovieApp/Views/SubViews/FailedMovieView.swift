//
//  FailedMovieView.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import SwiftUI

struct FailedMovieView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.square")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .padding()
            Text("No results found")
        }
    }
}

struct FailedMovieView_Previews: PreviewProvider {
    static var previews: some View {
        FailedMovieView()
    }
}
