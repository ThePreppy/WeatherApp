//
//  UserManager.swift
//  WeatherApp
//
//  Created by Александр on 09.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

class UserManager {
    
    static private let chosenUnitsKey = "chosenUnitsKey"
    
    static func setChosen(units: Units) {
        UserDefaults.standard.set(units.rawValue, forKey: chosenUnitsKey)
    }
    
    static func getChosenUnits() -> String? {
        return UserDefaults.standard.string(forKey: chosenUnitsKey)
    }
    
}
