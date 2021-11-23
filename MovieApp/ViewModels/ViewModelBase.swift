//
//  ViewModelBase.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/22/21.
//

import Foundation

enum LoadingState {
    case loading
    case success
    case failed
    case none 
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
