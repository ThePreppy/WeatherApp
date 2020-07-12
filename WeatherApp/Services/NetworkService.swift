//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

class NetworkService {
    
    enum RequestResponse {
        case success(JSON)
        case failed(Error?)
    }
    
    enum HTTPMethod: String {
        case delete = "DELETE"
        case put = "PUT"
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
    }
    
    func request(url: String, method: HTTPMethod, parameters: JSON? = nil, completion: @escaping (RequestResponse) -> ()) {
        
        let session = URLSession.shared
        guard let url = URL(string: url) else { completion(.failed(nil)); return }
        let headers = ["Content-Type" : "application/json", "Accept": "application/json"]
        
        var requst = URLRequest(url: url)
        requst.httpMethod = method.rawValue
        requst.allHTTPHeaderFields = headers
        
        if let parameters = parameters {
            requst.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        
        session.dataTask(with: requst) { (data, response, error) in
            
            if let error = error {
                completion(.failed(error))
            } else {
                guard let data = data else { completion(.failed(nil)); return }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON {
                        completion(.success(json))
                    } else {
                        completion(.failed(nil))
                    }
                } catch let error {
                    completion(.failed(error))
                }
            }
            
        }.resume()
    }
    
}

