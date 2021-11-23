//
//  MovieApiService.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation
import Alamofire

class MovieApiService : MovieApiServiceProtocol {
    
    //MARK: - properties
    private(set) var dispatcher: Dispatcher
    private(set) var getPopularsOperation: GetPopularsOperationType
    private(set) var getMovieDetailOperationType: GetMovieDetailOperationType

    public enum MovieError: Swift.Error {
        case parameterParsingError(internal: Swift.Error)
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    //MARK: - initializer
    public init() {
        self.dispatcher = NetworkDispatcher(environment: Utils.Env.MovieApi)
        self.getPopularsOperation = GetPopularsOperation()
        self.getMovieDetailOperationType = GetMovieDetailOperation()
    }
    
    //MARK: - methods
    func fetchPopularMovies(page: Int, completion: @escaping (MovieResult<MovieList, Error>) -> Void) {
        self.getPopularsOperation.page = page
        self.getPopularsOperation.execute(in: dispatcher) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(MovieError.networkError(internal: error)))
            }
        }
    }
    
    func fetchMovie(movieId: Int, completion: @escaping (MovieResult<MovieDetail, Error>) -> Void) {
        self.getMovieDetailOperationType.movieId = movieId
        self.getMovieDetailOperationType.execute(in: dispatcher) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(MovieError.networkError(internal: error)))
            }
        }
    }

}
