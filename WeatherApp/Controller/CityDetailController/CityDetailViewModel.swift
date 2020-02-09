//
//  CityDetailViewModel.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

class CityDetailViewModel: CityDetailModelType {
    private var cityID: Int
    var cityWeather: CityDetail?
    var cityName: String
    
    required init(_ cityID: Int, cityName: String) {
        self.cityName = cityName
        self.cityID = cityID
    }
    
    func fetchWeather(completion: @escaping (Error?) -> ()) {
        let chosenUnitRawValue = UserManager.getChosenUnits()
        let chosenUnit = Units(rawValue: chosenUnitRawValue ?? "C")
        WeatherManager.fetchWeatherInCity(cityID: cityID, units: chosenUnit ?? .Celsius) { (model, error) in
            self.cityWeather = model
            completion(error)
        }
    }
    
}
