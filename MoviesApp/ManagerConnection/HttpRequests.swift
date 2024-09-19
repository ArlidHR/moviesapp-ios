//
//  ManageConnections.swift
//  BreedsApp
//
//  Created by Arlid Henao Rueda on 19/06/23.
//

import Foundation
import Alamofire

class HttpRequests {
    func request(method: HTTPMethod, url: String, parameters: [String: Any]? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
