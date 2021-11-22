//
//  MovieDetailContracts.swift
//  MovieMaster
//
//  Created by Furkan Torun on 23.11.2021.
//

import Foundation

protocol MovieDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieDetailViewModelOutput)
    func showDetail(_ presentation: MovieDetail)
}

enum MovieDetailViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}


