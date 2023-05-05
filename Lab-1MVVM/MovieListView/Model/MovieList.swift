//
//  MovieList.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import Foundation

struct MovieList: Codable {
    let created_by: String
    let description: String
    let favorite_count: Int
    let id: String
    let items : [ItemList]
    let item_count: Int
    let iso_639_1: String
    let name: String
    let poster_path: String
}

struct ItemList : Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let media_type: String
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count: Int
}
