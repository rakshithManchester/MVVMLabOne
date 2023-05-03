//
//  MovieList.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import Foundation

struct MovieList: Codable {
    var created_by: String
    var description: String
    var favorite_count: Int
    var id: String
    var items : [ItemList]
    var item_count: Int
    var iso_639_1: String
    var name: String
    var poster_path: String
}

struct ItemList : Codable {
    var adult: Bool
    var backdrop_path: String
    var genre_ids: [Int]
    var id: Int
    var media_type: String
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Float
    var poster_path: String
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Float
    var vote_count: Int
}
