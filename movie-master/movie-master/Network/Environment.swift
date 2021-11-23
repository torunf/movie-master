//
//  Environment.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation

struct Utils {
    struct Env {
        static let MovieApi = Environment("Movie API", host: "https://api.themoviedb.org/3")
        static let ApiKey:String = "2dae3c37758b8193ee4991d4b0462e50"
    }
}

public struct Environment {
    
    public var name: String
    public var host: String
    public var headers: [String: Any] = ["Content-Type": "application/json"]
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    /// Initialize a new Environment
    ///
    /// - Parameters:
    ///   - name: name of the environment
    ///   - host: base url
    public init(_ name: String, host: String) {
        self.name = name
        self.host = host
    }
}
