//
//  MovielistViewModel.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 04/05/23.
//

import Foundation
import UIKit

final class MovielistViewModel {
    var moviesdata: MovieList?
    let imgBaseURL = "https://image.tmdb.org/t/p/w500/"
    var movieImg: UIImage?
    
    func fetchTitle(IndexPath: Int) -> String {
        return moviesdata?.items[IndexPath].title ?? ""
    }
    func fetchPoster(IndexPath: Int) -> UIImage {
        var imgData = Data()
        if let posterUrl = moviesdata?.items[IndexPath].poster_path, let imgUrl = URL(string: imgBaseURL + posterUrl) {
            do {
                URLSession.shared.dataTask(with: imgUrl) {[weak self] data, response, error in
                    imgData = data ?? Data()
                    self?.movieImg = UIImage(data: imgData)!
                }.resume()
            } catch let exp {
                print(exp)
            }
        }
        return self.movieImg ?? UIImage()
    }
}
