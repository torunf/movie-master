//
//  MovieRequests.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation

public enum MovieRequests: Request {
    
    
    case popular(api_key: String, page: Int)

    public var path: String {
        switch self {
        case .popular(_, _):
            return "Popular movies"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .popular:
            return .get
        }
    }
    
    public var parameters: RequestParameters? {
        switch self {
        case .popular(let api_key, let page):
            return .url(["api_key": String(api_key),
                         "page": String(page)])
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
        }
    }
    
}
