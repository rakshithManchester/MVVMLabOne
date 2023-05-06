//
//  MovielistViewModel.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 04/05/23.
//

import Foundation

final class MovielistViewModel {
    var moviesdata: MovieList?
    var posterImage: Data?
    
    func fetchTitle(indexPath: Int) -> String {
        return moviesdata?.items[indexPath].title ?? ""
    }
    
    func fetchImage(indexPath: Int) -> URL? {
        guard  let posterUrl = moviesdata?.items[indexPath].posterPath else { return nil }
        guard let imgUrl = URL(string: Constants.imgBaseURL + posterUrl) else { return nil }
        return imgUrl
    }
}
