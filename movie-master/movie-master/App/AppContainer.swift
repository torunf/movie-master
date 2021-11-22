//
//  AppContainer.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = MovieApiService()
}
