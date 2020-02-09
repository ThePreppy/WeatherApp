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
        var api: String
        if units == .Kelvin {
            api = Constants.domain + "/weather?id=\(id)&lang=\(lang)&APPID=\(Constants.secretKey)"
        } else {
            api = Constants.domain + "/weather?id=\(id)&lang=\(lang)&units=\(units.serverValue)&APPID=\(Constants.secretKey)"
        }
        
        networkService.request(url: api, method: .post) { (response) in
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
