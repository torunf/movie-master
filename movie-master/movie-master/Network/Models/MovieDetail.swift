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
        case overview = "overview"
        case firstAirDate = "first_air_date"
        case poster = "poster_path"
    }
    
    public let id: Int
    public let name: String
    public let overview: String
    public let firstAirDate: Date
    public let poster: String

    public var firstAirDateFormatted: String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        return dateFormatterPrint.string(from: firstAirDate)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(overview, forKey: .overview)
        try container.encode(firstAirDate, forKey: .firstAirDate)
        try container.encode(poster, forKey: .poster)
    }
}
