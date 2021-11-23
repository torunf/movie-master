//
//  GetPopularsOperation.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation
import AVFoundation

protocol GetPopularsOperationType {
    var api_key: String { get set }
    var page: Int { get set }
    var request: Request { get }
    init(api_key: String, page: Int)
    func execute(in dispatcher: Dispatcher, completion: @escaping (MovieResult<MovieList, Error>) -> Void)
}

final class GetPopularsOperation: Operation, GetPopularsOperationType {

    typealias D = Dispatcher
    typealias R = MovieList
    
    // MARK: Request parameters
    var api_key: String
    var page: Int
    
    init() {
        self.api_key = ""
        self.page = 0
    }
    
    init(api_key: String, page: Int) {
        self.api_key = api_key
        self.page = page
    }
    
    var request: Request {
        MovieRequests.popular(api_key: api_key, page: page)
    }
    
    func execute(in dispatcher: Dispatcher, completion: @escaping (MovieResult<MovieList, Error>) -> Void) {
        self.executeBaseResponse(dispatcher: dispatcher, completion: completion)
    }
}
