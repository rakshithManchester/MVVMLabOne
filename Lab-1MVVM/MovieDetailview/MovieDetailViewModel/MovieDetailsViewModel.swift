//
//  MovieDetailsViewModel.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 08/05/23.
//

import UIKit

final class MovieDetailsViewModel {
    var movie: MovieDetail!
    init(movieList: MovieDetail!) {
        self.movie = movieList
    }
    
    func getMoviePosterImg() -> URL? {
        if let imgUrl = URL(string: Constants.AppConstants.imgBaseURL.rawValue + movie.posterPath) {
           return imgUrl
        }
        return nil
    }
    func getMovieTitle() -> String {
        return movie.title
    }
}
