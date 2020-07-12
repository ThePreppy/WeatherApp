//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

enum Units: String {
    case Celsius = "C"
    case Kelvin = "K"
    case Fahrenheit = "F"
    
    var serverValue: String {
        switch self {
        case .Celsius:
            return "metric"
        case .Fahrenheit:
            return "imperial"
        case .Kelvin:
            return ""
        }
    }
}

class WeatherManager {
    static private let networkService = NetworkService()
    static private let jsonDecoder = JSONDecoderService()
    
    static func fetchWeatherInCity(cityID id: Int, units: Units, lang: String = "en", completion: @escaping (CityDetail?, Error?) -> ()) {
        guard var urlComponents = URLComponents(string: Constants.domain + "/weather") else { return }
        var parameters = ["APPID" : Constants.secretKey, "id" : "\(id)", "lang" : lang]
        if units != .Kelvin {
            parameters["units"] = units.serverValue
        }
        
        urlComponents.queryItems = parameters.map({ URLQueryItem(name: $0.key, value: $0.value) })
        
        guard let url = urlComponents.url else { return }
        
        networkService.request(url: url.absoluteString, method: .post) { (response) in
            switch response {
            case .success(let json):
                jsonDecoder.decodeJSON(of: CityDetail.self, json: json) { (decoded) in
                    completion(decoded, nil)
                }
            case .failed(let error):
                completion(nil, error)
            }
        }
    }
    
}
