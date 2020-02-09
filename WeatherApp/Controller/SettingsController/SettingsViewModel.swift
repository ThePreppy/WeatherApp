//
//  SettingsControllerViewModel.swift
//  WeatherApp
//
//  Created by Александр on 09.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

class SettingsViewModel: SettingsModelType {
    
    enum SegmentValue: Int {
        case celsius = 0
        case kelvin = 1
        case fahrenheit = 2
    }
    
    func chosenValue() -> Int {
        let chosenValue = UserManager.getChosenUnits() ?? "C"
        let units = Units(rawValue: chosenValue) ?? .Celsius
        switch units {
        case .Celsius:
            return 0
        case .Kelvin:
            return 1
        case .Fahrenheit:
            return 2
        }
        
    }
    
    func segmentValueDidChanged(segment: Int) {
        guard let segmentValue = SegmentValue(rawValue: segment) else { return }
        switch segmentValue {
        case .celsius:
            UserManager.setChosen(units: .Celsius)
        case .kelvin:
            UserManager.setChosen(units: .Kelvin)
        case .fahrenheit:
            UserManager.setChosen(units: .Fahrenheit)
        }
    }
    
}
