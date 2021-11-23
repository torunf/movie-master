//
//  MovieApiServiceProtocol.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation
import Alamofire

public protocol MovieApiServiceProtocol {
    func fetchPopularMovies(page: Int, completion: @escaping (MovieResult<MovieList, Error>) -> Void)
    func fetchMovie(movieId: Int, completion: @escaping (MovieResult<MovieDetail, Error>) -> Void)
}

