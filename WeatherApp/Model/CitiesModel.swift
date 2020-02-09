//
//  CitiesModel.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

import Foundation

// MARK: - Cities
struct Cities: Codable {
    let cities: [City]
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let country: Country
    let coord: Coord
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

enum Country: String, Codable {
    case ua = "UA"
    
    func name() -> String {
        switch self {
        case .ua:
            return "Ukraine"
        }
    }
}
