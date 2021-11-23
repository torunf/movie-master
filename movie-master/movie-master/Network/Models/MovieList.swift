//
//  BaseModel.swift
//  movie-master
//
//  Created by Furkan Torun on 23.11.2021.
//

import UIKit
import Foundation

public class MovieList: Codable {
    
    public enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    public let page: Int
    public let results: [Movie]
    public let totalPages: Int
    public let totalResults: Int
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(page, forKey: .page)
        try container.encode(results, forKey: .results)
        try container.encode(totalPages, forKey: .totalPages)
        try container.encode(totalResults, forKey: .totalResults)
    }
    
}
