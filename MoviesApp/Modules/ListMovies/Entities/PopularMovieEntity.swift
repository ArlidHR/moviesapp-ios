//
//  PopularMovieEntity.swift
//  MoviesApp
//
//  Created by Arlid Henao Rueda on 17/09/24.
//

import Foundation

struct PopularMovieResponseEntity: Decodable {
    let results: [PopularMovieEntity]
}

struct PopularMovieEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imageURL: URL?
    var votes: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case votes = "vote_count"
    }
}
