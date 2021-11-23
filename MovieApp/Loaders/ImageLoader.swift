//
//  ImageLoader.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/19/21.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else {
            print("Bad URL")
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, error == nil else {
                print("Error in data task")
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
