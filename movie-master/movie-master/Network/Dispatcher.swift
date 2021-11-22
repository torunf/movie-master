//
//  Dispatcher.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//

import Alamofire
import Foundation

protocol Dispatcher {

    init(environment: Environment)
    
    /// This function execute the request and provide a completion handler with the response
    ///
    /// - Parameters:
    ///   - request: request to execute
    ///   - completion: completion handler for the request
    /// - Throws: error
    func execute(request: Request, completion: @escaping (_ response: Response) -> Void) throws
}
