//
//  MovieDetailViewModel.swift
//  MovieMaster
//
//  Created by Furkan Torun on 23.11.2021.
//

import Foundation

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    weak var delegate: MovieDetailViewModelDelegate?
    private let presentation: MovieDetail
    
    init(MovieDetail: MovieDetail) {
        self.presentation = MovieDetail
    }
    
    func load() {
        delegate?.handleViewModelOutput(.updateTitle("\(self.presentation.name.uppercased()) DETAIL"))
        delegate?.showDetail(presentation)
    }
    
}
