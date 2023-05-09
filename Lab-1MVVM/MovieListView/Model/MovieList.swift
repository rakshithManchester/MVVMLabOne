//
//  MovieList.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import Foundation

struct MovieList: Decodable {
    let createdBy: String
    let description: String
    let favoriteCount: Int
    let id: String
    let moviesDetailList : [MovieDetail]
    let itemCount: Int
    let iso: String
    let name: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case createdBy = "created_by"
        case description
        case favoriteCount = "favorite_count"
        case id
        case moviesDetailList = "items"
        case itemCount = "item_count"
        case iso = "iso_639_1"
        case name
        case posterPath = "poster_path"
    }
//    init(createdBy: String, description: String, favoriteCount: Int, id: String, items: [ItemList], itemCount: Int, iso: String, name: String, posterPath: String) {
//        self.createdBy = createdBy
//        self.description = description
//        self.favoriteCount = favoriteCount
//        self.id = id
//        self.items = items
//        self.itemCount = itemCount
//        self.iso = iso
//        self.name = name
//        self.posterPath = posterPath
//    }
}

struct MovieDetail : Decodable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let mediaType: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
//    init(adult: Bool, backdropPath: String, genreIds: [Int], id: Int, mediaType: String, originalLanguage: String, originalTitle: String, overview: String, popularity: Float, posterPath: String, releaseDate: String, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
//        self.adult = adult
//        self.backdropPath = backdropPath
//        self.genreIds = genreIds
//        self.id = id
//        self.mediaType = mediaType
//        self.originalLanguage = originalLanguage
//        self.originalTitle = originalTitle
//        self.overview = overview
//        self.popularity = popularity
//        self.posterPath = posterPath
//        self.releaseDate = releaseDate
//        self.title = title
//        self.video = video
//        self.voteAverage = voteAverage
//        self.voteCount = voteCount
//    }
}
