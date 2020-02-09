//
//  CityCellViewModel.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

class CityCellViewModel: CityCellModelType {
    
    let city: City
    
    required init(_ city: City) {
        self.city = city
    }
    
    var countryName: String {
        return city.country.name()
    }
    
    var cityName: String {
        return city.name
    }
    
    var coordinates: Coord {
        return city.coord
    }
    
    
}
