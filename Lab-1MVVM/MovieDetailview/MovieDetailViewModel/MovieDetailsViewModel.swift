//
//  MovieDetailsViewModel.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 08/05/23.
//

import UIKit
//TODO: this viewModel correct? ViewModel does not have properties declared in ViewModel but accessing values from the func calls.
final class MovieDetailsViewModel {
    var movieList: ItemList!
    
    func getMoviePosterImg() -> URL {
        if let imgUrl = URL(string: Constants.AppConstants.imgBaseURL.rawValue + movieList.posterPath) {
           return imgUrl
        }
        //TODO: How to handle unwrapping & returning url ??
        return URL(string: "")!
    }
    func getMovieTitle() -> String {
        return movieList.title
    }
}
