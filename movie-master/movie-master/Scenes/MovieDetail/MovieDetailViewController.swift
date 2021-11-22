//
//  MovieDetailViewController.swift
//  MovieMaster
//
//  Created by Furkan Torun on 23.11.2021.
//

import Foundation
import UIKit
import Kingfisher

final class MovieDetailViewController: UIViewController {
    
    var viewModel: MovieDetailViewModelProtocol!
    var loading : UIView?

    let imgMissionPatch: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let lblMissionName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 28)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let lblDetail: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblMovieDate: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textAlignment = .right
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = false
        return v
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
    
    public func showSpinner(isLoading: Bool) {
        if(!isLoading) {
            DispatchQueue.main.async {
                self.loading?.removeFromSuperview()
                self.loading = nil
            }
            return
        }
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = view.center
             
        DispatchQueue.main.async {
            self.view.addSubview(ai)
        }
        loading = ai
    }
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    func handleViewModelOutput(_ output: MovieDetailViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            showSpinner(isLoading: isLoading)
        }
    }
    
    func showDetail(_ presentation: MovieDetail) {
        
        self.view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50.0).isActive = true

        scrollView.addSubview(imgMissionPatch)
        imgMissionPatch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        imgMissionPatch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        imgMissionPatch.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20.0).isActive = true
        imgMissionPatch.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true

        scrollView.addSubview(lblMissionName)
        lblMissionName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        lblMissionName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        lblMissionName.topAnchor.constraint(equalTo: imgMissionPatch.bottomAnchor, constant: 16.0).isActive = true

        scrollView.addSubview(lblDetail)
        lblDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        lblDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        lblDetail.topAnchor.constraint(equalTo: lblMissionName.bottomAnchor, constant: 16).isActive = true
        lblDetail.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16.0).isActive = true
        
        self.view.addSubview(lblMovieDate)
        lblMovieDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        lblMovieDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        lblMovieDate.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5).isActive = true
        lblMovieDate.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true

        let url: URL?
//        if presentation.poster != nil {
            url = URL(string: presentation.poster)
//        }
//        else {
//            url = URL(string: "https://pic.onlinewebfonts.com/svg/img_546302.png")
//        }
        
        imgMissionPatch.kf.indicatorType = .activity
        imgMissionPatch.kf.setImage(with: url)
        lblMissionName.text = presentation.name
//        lblDetail.text = presentation.details
//        lblMovieDate.text = presentation.MovieDateFormatted
    }
    

    

}
