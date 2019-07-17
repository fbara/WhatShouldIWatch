//
//  MovieView.swift
//  WhatShouldIWatch
//
//  Created by Frank Bara on 7/16/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct MovieView : View {
    var movies: [Movie] = []
    
    var body: some View {
        List(movies) { movie in
            HStack {
                Image(uiImage: movie.link.downloadCoverImage())
                .resizable()
                    .frame(width: 87, height: 127)
                .cornerRadius(10)
                Text(movie.title)
            }
        }

    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MovieView(movies: [MovieDataProvider.shared.movies[0]])
    }
}
#endif
