//
//  Constants.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 05/05/23.
//

import Foundation

enum Constants {
    enum AppConstants: String {
        case imgBaseURL = "https://image.tmdb.org/t/p/w500/"
        case movieListBaseURL = "https://api.themoviedb.org/3/list/1?api_key=0e6dd54d1af0024aefdbdd5f8f422992&language=en-US"
    }
    enum TableCellConstants: String {
        case movieCellID = "MovieListCell"
        case movieTableviewcellName = "MovieListTableViewCell"
    }
}
