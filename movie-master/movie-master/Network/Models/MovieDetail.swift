//
//  MovieDetail.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import UIKit
import Foundation

public struct MovieDetail: Codable, Equatable {
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case rating = "vote_average"
        case detail = "overview"
        case firstAirDate = "first_air_date"
        case poster = "poster_path"
        case vote = "vote_count"
    }
    
    public let id: Int
    public let name: String
    public let detail: String
    public let rating: Float
    public let firstAirDate: Date?
    public let poster: String?
    public let vote: Int

    public var firstAirDateFormatted: String {
        if (firstAirDate == nil) {
            return "Unknown!"
        }
        else if (firstAirDate! == Date(timeIntervalSince1970: 0)) {
            return "Unknown!"
        }
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        return dateFormatterPrint.string(from: firstAirDate!)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(rating, forKey: .rating)
        try container.encode(detail, forKey: .detail)
        try container.encode(firstAirDate, forKey: .firstAirDate)
        try container.encode(poster, forKey: .poster)
        try container.encode(vote, forKey: .vote)
    }
}
