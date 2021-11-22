//
//  MovieListContracts.swift
//  MovieMaster
//
//  Created by Furkan Torun on 23.11.2021.
//

import Foundation

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    var fetchingMore: Bool { get set }
    func load()
    func getList()
    func getDetail(withIndex ix: Int)
}

public enum Operations: Equatable {
    case list
}

enum MovieListViewModelOutput: Equatable {
    static func == (lhs: MovieListViewModelOutput, rhs: MovieListViewModelOutput) -> Bool {
        return true
    }
    case updateTitle(String)
    case setLoading(Bool, _ operation: Operations)
    case showMovieList(Bool)
}

enum MovieListViewRoute {
    case detail(MovieDetailViewModelProtocol)
}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
    func navigate(to route: MovieListViewRoute)

}
