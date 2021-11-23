//
//  Movie.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import UIKit
import Foundation

public struct Movie: Codable, Equatable {
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case rating = "vote_average"
        case firstAirDate = "first_air_date"
        case thumbnail = "backdrop_path"
        case detail = "overview"
    }
    
    public let id: Int
    public let name: String
    public let rating: Float
    public var firstAirDate: Date?
    public let thumbnail: String?
    public let detail: String
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(rating, forKey: .rating)
        try container.encode(firstAirDate, forKey: .firstAirDate)
        try container.encode(thumbnail, forKey: .thumbnail)
        try container.encode(detail, forKey: .detail)
    }
}
