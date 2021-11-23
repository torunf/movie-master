//
//  Result.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Foundation

public enum MovieResult<Success, Failure> {
    case success(Success)
    case failure(Failure)
}
