//
//  Response.swift
//  movie-master
//
//  Created by Furkan Torun on 22.11.2021.
//


import Alamofire
import Foundation

public class Response {
    
    public typealias JSON = [String: Any]
    
    var json: JSON?
    var data: Data?
    var error: Error?
    var dataCount: Int = 0
    
    init(_ dataResponse: AFDataResponse<Any>, for request: Request) {

        // response validation
        guard let statusCode = dataResponse.response?.statusCode else {
            self.error = dataResponse.error
            return
        }
        if statusCode == 401, dataResponse.error == nil {
            self.error = NetworkError.notAuthorized
            return
        }
        if statusCode == 403, dataResponse.error == nil {
            self.error = NetworkError.forbidden
            return
        }
        guard Array(200 ... 299).contains(statusCode), dataResponse.error == nil else {
            self.error = dataResponse.error
            return
        }
        guard let data = dataResponse.data else {
            self.error = NetworkError.noData
            return
        }

        let jsonx: JSON? = nil
        
        let count = dataResponse.response?.headers["Spacex-Api-Count"]
        let tCount: Int = count == nil ? 0 : Int(count!)!
        self.dataCount = tCount
        
        switch request.dataType {
        case .data:
            self.data = data
        case .JSON:
            self.json = jsonx!

        }
    }
}
