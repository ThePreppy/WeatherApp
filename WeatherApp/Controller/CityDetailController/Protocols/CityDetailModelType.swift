//
//  CityDetailModelType.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

protocol CityDetailModelType: class {
    func fetchWeather(completion: @escaping (Error?) -> ())
    var cityWeather: CityDetail? { get }
    var cityName: String { get }
    init(_ cityID: Int, cityName: String)
}
