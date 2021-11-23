//
//  GetDetailOperation.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation
import AVFoundation

protocol GetMovieDetailOperationType {
    var api_key: String { get set }
    var movieId: Int { get set }
    var request: Request { get }
    init(api_key: String, movieId: Int)
    func execute(in dispatcher: Dispatcher, completion: @escaping (MovieResult<MovieDetail, Error>) -> Void)
}

final class GetMovieDetailOperation: Operation, GetMovieDetailOperationType {

    typealias D = Dispatcher
    typealias R = MovieDetail
    
    // MARK: Request parameters
    var api_key: String
    var movieId: Int
    
    init() {
        self.api_key = ""
        self.movieId = 0
    }
    
    init(api_key: String, movieId: Int) {
        self.api_key = api_key
        self.movieId = movieId
    }
    
    var request: Request {
        MovieRequests.get(api_key: api_key, movieId: movieId)
    }
    
    func execute(in dispatcher: Dispatcher, completion: @escaping (MovieResult<MovieDetail, Error>) -> Void) {
        self.executeBaseResponse(dispatcher: dispatcher, completion: completion)
    }
}
