//
//  MovieListViewController.swift
//  MovieMaster
//
//  Created by Furkan Torun on 23.11.2021.
//

import Foundation
import UIKit
import Kingfisher

final class MovieListViewController: UIViewController {
    
    var viewModel: MovieListViewModelProtocol!
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
        tableView?.dataSource = viewModel as? UITableViewDataSource
        tableView?.estimatedRowHeight = 100
    }
    
    public func showSpinner(isLoading: Bool, operation: Operations) {
        
        if isLoading {
            DispatchQueue.main.async {
                switch operation {
                case .list:
                    self.view.activityStartAnimating(activityColor: UIColor.gray, backgroundColor: UIColor.white.withAlphaComponent(0.1))
                }
            }
        }
        else {
            DispatchQueue.main.async {
                switch operation {
                case .list:
                    self.view.activityStopAnimating()
                }
            }
        }
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
            break
        case .setLoading(let isLoading, let operation):
            showSpinner(isLoading: isLoading, operation: operation)
            break
        case .showMovieList(_):
            self.tableView?.reloadData()
            break
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = MovieDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.getDetail(withIndex: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > (contentHeight - scrollView.frame.height){
            if self.viewModel!.fetchingMore {
                self.viewModel.getList()
                
            }
        }
    }
}
