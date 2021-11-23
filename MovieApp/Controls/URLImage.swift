//
//  URLImage.swift
//  MovieApp
//
//  Created by Jon Sweeney on 11/19/21.
//

import SwiftUI

// Replaced by AsyncImage in iOS 15.0

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
      
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("placeholder").resizable()
        }
    }
}

    struct URLImage_Previews: PreviewProvider {
        static var previews: some View {
            URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
        }
    }
