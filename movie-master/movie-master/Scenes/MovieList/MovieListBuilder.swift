//
//  MovieListBuilder.swift
//  MovieMaster
//
//  Created by Furkan Torun on 23.11.2021.
//

import UIKit

final class MovieListBuilder {

    static func make() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MovieListViewController") as! MovieListViewController
        viewController.viewModel = MovieListViewModel(service: app.service)
        return viewController
    }
    
}
