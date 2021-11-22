//
//  MovieApiServiceProtocol.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation
import Alamofire

public protocol MovieApiServiceProtocol {
    func fetchPopularMovies(completion: @escaping (MovieResult<[Movie], Error>) -> Void)
}

