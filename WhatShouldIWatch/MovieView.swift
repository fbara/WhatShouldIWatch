//
//  MovieView.swift
//  WhatShouldIWatch
//
//  Created by Frank Bara on 7/16/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct MovieView : View {
    @State var movies: [Movie] = []
    @State var searchTerm = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField($searchTerm, placeholder: Text("Search...")) {
                    self.processSearch()
                    UIApplication.shared.keyWindow?.endEditing(true)
                }
                Image(systemName: "xmark.circle.fill")
                    .tapAction {
                        self.searchTerm = ""
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            List(movies) { movie in
                HStack {
                    Image(uiImage: movie.link.downloadCoverImage())
                        .resizable()
                        .frame(width: 87, height: 127)
                        .cornerRadius(10)
                        VStack {
                            ScrollView {
                                Text(movie.title)
                                    .font(.largeTitle)
                            }
                            // TODO: Rating
                        }
                    
                    }
                }
            }

    }
    
    private func processSearch() {
        if searchTerm == "" {
            movies = MovieDataProvider.shared.ratedMovies()
        } else {
            movies = MovieDataProvider.shared.performSearch(for: searchTerm)
        }
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MovieView(movies: [MovieDataProvider.shared.movies[1]])
    }
}
#endif
