//
//  CityCellType.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

protocol CityCellModelType: class {
    var countryName: String { get }
    var cityName: String { get }
    var coordinates: Coord { get }
    init(_ city: City)
}
