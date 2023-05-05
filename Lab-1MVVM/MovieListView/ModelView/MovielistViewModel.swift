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
    
    var movieImg: UIImage?
    
    func fetchTitle(indexPath: Int) -> String {
        return moviesdata?.items[indexPath].title ?? ""
    }
    func fetchPoster(indexPath: Int) -> UIImage {
        var imgData = Data()
        if let posterUrl = moviesdata?.items[indexPath].poster_path, let imgUrl = URL(string: Constants.imgBaseURL + posterUrl) {
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
