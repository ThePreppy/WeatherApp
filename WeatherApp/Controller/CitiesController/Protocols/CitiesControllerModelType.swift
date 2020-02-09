//
//  CitiesControllerModelType.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

protocol CitiesControllerModelType: class {
    func numberOfRows() -> Int
    func fetchCities(completion: @escaping (Bool) -> ())
    func viewModelForCell(atIndexPath indexPath: IndexPath) -> CityCellModelType
    func didSelectRow(atIndexPath indexPath: IndexPath) -> CityDetailModelType
}
