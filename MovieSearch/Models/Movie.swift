//
//  Movie.swift
//  MovieSearch
//
//  Created by Sebastian Banks on 4/8/22.
//

import Foundation

struct TopLevelObject: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String
    let rating: Double
    let summary: String
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rating = "vote_average"
        case summary = "overview"
        case poster = "poster_path"
    }
}
