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
    
    public enum FlightError: Swift.Error {
        case parameterParsingError(internal: Swift.Error)
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    //MARK: - initializer
    public init() {
        self.dispatcher = NetworkDispatcher(environment: Utils.Env.SpaceX)
        self.getPopularsOperation = GetPopularsOperation()
    }
    
    //MARK: - methods
    func fetchPopularMovies(completion: @escaping (MovieResult<[Movie], Error>) -> Void) {
        getPopularsOperation.execute(in: dispatcher) { result in
            switch result {
            case .success(let response, _):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(FlightError.networkError(internal: error)))
            }
        }
    }
}
