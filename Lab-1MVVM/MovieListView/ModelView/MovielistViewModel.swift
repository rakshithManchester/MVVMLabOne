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
    func fetchPoster(indexPath: Int) -> Data {
        if let posterUrl = moviesdata?.items[indexPath].poster_path, let imgUrl = URL(string: Constants.imgBaseURL + posterUrl) {
            do {
                URLSession.shared.dataTask(with: imgUrl) {[weak self] data, response, error in
                    self?.posterImage = data
                }.resume()
            } catch let exp {
                print(exp)
            }
        }
        guard let posterImg = self.posterImage else { return Data()}
        return posterImg
    }
}
