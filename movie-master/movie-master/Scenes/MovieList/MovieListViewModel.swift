//
//  MovieListViewModel.swift
//  MovieObserver
//
//  Created by Furkan Torun on 23.11.2021.
//

import Foundation
import UIKit
import Kingfisher
import SwiftUI

final class MovieListViewModel: NSObject, MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private let service: MovieApiServiceProtocol
    private var allMovies: [Movie]? = []
    private var MoviesTotalCount: Int = 0
    private var page = 1
    private var perPage = 8
    var fetchingMore: Bool = true
    var totalPage: Int {
        if MoviesTotalCount == 0 {
            return 0
        }
        return (MoviesTotalCount / perPage) + 1
    }
    
    init(service: MovieApiServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Popula Movies"))
    }
    
    func getList() {
        self.fetchingMore = false
        notify(.setLoading(true, .list))
        
        service.fetchPopularMovies { [weak self] (result) in
            
            guard self != nil else { return }
            switch result {
            case .success(let response, let count):
                self?.allMovies?.append(contentsOf: response)
                self?.MoviesTotalCount = count
                if self!.page < self!.totalPage {
                    self!.page += 1
                    self!.fetchingMore = true
                }
                self?.notify(.showMovieList(true))
                self?.notify(.setLoading(false, .list))
            case .failure(let error):
                print(error)
            }
            
        }
        
//        service.fetchAllMovies(page: self.page, perPage: self.perPage) { [weak self](result) in
//            guard self != nil else { return }
//            switch result {
//            case .success(let response, let count):
//                self?.allMovies?.append(contentsOf: response)
//                self?.MoviesTotalCount = count
//                if self!.page < self!.totalPage {
//                    self!.page += 1
//                    self!.fetchingMore = true
//                }
//                self?.notify(.showMovieList(true))
//                self?.notify(.setLoading(false, .list))
//            case .failure(let error):
//                print(error)
//            }
//        }
    }

    func getDetail(withIndex ix: Int) {
        let item = self.allMovies![ix]
//        service.fetchMovie(MovieNumber: item.MovieNumber) { [weak self](result) in
//            guard self != nil else { return }
//            switch result {
//            case .success(let response, _):
//                let viewModel = MovieDetailViewModel(MovieDetail: response)
//                self!.delegate?.navigate(to: .detail(viewModel))
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

extension MovieListViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if allMovies != nil {
            return allMovies!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? MovieDetailRow {
            let item = allMovies![indexPath.row]
            cell.lblMovieHeader?.text = item.name
            cell.lblMovieDate?.text = item.firstAirDateFormatted
            
            let url: URL?
//            if item.poster != nil {
//                url = URL(string: item.links.mission_patch_small!)
//            }
//            else {
//                url = URL(string: "https://pic.onlinewebfonts.com/svg/img_546302.png")
//            }
            cell.imgMovie!.kf.indicatorType = .activity
//            cell.imgMovie!.kf.setImage(with: url)
            cell.lblMovieDetail?.text = item.name ?? ""
            
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
