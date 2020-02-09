//
//  CitiesViewModel.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

typealias JSON = [String : Any]

class CitiesViewModel: CitiesControllerModelType {
    
    private var cities: [City] = []
    private let jsonDecoder = JSONDecoderService()
    
    func fetchCities(completion: @escaping (Bool) -> ()) {
        guard let path = Bundle.main.path(forResource: "Cities", ofType: "json") else { completion(false); return }
        let url = URL(fileURLWithPath: path)
        
        if let citiesData = try? Data(contentsOf: url) {
            
            if let json = try? JSONSerialization.jsonObject(with: citiesData, options: []) as? JSON {
                
                jsonDecoder.decodeJSON(of: Cities.self, json: json) { [unowned self] (decodable) in
                    guard let citiesModel = decodable else { return }
                    self.cities = citiesModel.cities
                    self.cities.sort(by: { $0.name < $1.name })
                    completion(true)
                }
                
            } else { completion(false) }
        } else { completion(false) }
        
    }
    
    func numberOfRows() -> Int {
        cities.count
    }
    
    func viewModelForCell(atIndexPath indexPath: IndexPath) -> CityCellModelType {
        let city = cities[indexPath.row]
        let cellViewModel = CityCellViewModel(city)
        return cellViewModel
    }
    
    func didSelectRow(atIndexPath indexPath: IndexPath) -> CityDetailModelType {
        let city = cities[indexPath.row]
        let detailControllerViewModel = CityDetailViewModel(city.id, cityName: city.name)
        return detailControllerViewModel
    }
    
}
