//
//  SettingsModelType.swift
//  WeatherApp
//
//  Created by Александр on 09.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

protocol SettingsModelType {
    func segmentValueDidChanged(segment: Int)
    func chosenValue() -> Int
}
