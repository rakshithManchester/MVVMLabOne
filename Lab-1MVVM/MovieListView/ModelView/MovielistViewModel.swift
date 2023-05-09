//
//  MovielistViewModel.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 04/05/23.
//

import Foundation

final class MovielistViewModel {
    var movieList: MovieList?
    var posterImage: Data?
    var posterImageString: String?
    
    func fetchTitle(indexPath: Int) -> String {
        return movieList?.moviesDetailList[indexPath].title ?? ""
    }
    func fetchImage(indexPath: Int) -> URL? {
        guard  let posterUrl = movieList?.moviesDetailList[indexPath].posterPath else { return nil }
        guard let imgUrl = URL(string: Constants.AppConstants.imgBaseURL.rawValue + posterUrl) else { return nil }
        return imgUrl
    }
}
