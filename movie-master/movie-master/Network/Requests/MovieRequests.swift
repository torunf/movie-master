//
//  MovieRequests.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation

public enum MovieRequests: Request {
    
    
    case popular(api_key: String, page: Int)
    case get(api_key: String, movieId: Int)

    public var path: String {
        switch self {
        case .popular(_, _):
            return "tv/popular"
        case .get(_, let id):
            return "tv/\(id)"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .popular:
            return .get
        case .get:
            return .get
        }
    }
    
    public var parameters: RequestParameters? {
        switch self {
        case .popular(_, let page):
            return .url(["api_key": Utils.Env.ApiKey,
                         "page": String(page)])
        case .get(_, _):
            return .url(["api_key": Utils.Env.ApiKey])
        }
    }
    
    public var headers: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    public var dataType: DataType {
        switch self {
        case .popular:
            return .data
        case .get:
            return .data
        }
    }
    
}
