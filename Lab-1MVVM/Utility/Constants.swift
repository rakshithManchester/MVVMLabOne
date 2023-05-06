//
//  Constants.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 05/05/23.
//

import Foundation

struct Constants { // convert to enum
    static let imgBaseURL = "https://image.tmdb.org/t/p/w500/"
    static let movieList = "https://api.themoviedb.org/3/list/1?api_key=0e6dd54d1af0024aefdbdd5f8f422992&language=en-US"
    static let movieCellID = "MovieListCell"  // seperate enum inside
    static let movieTableviewcellName = "MovieListTableViewCell"
}

//enum ConstantsEnum: String {
//
//    typealias RawValue = String
//
//    enum AppConstants: String {
//        case imgBaseURL = "https://image.tmdb.org/t/p/w500/"
//        case movieList = "https://api.themoviedb.org/3/list/1?api_key=0e6dd54d1af0024aefdbdd5f8f422992&language=en-US"
//    }
//    enum TableCellConstants {
//        case movieCellID = "MovieListCell"
//        case movieTableviewcellName = "MovieListTableViewCell"
//    }
//}

//enum Constants {
//
//  enum AppConstants {
//    case url = "xyz"
//  }
//
//  enum TableCell {
//    case movieList = "abc"
//  }
//}
