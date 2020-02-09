//
//  Storyboard.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

enum StoryboardModule: String {
    case Main
}

enum Controller: String {
    case CitiesController
    case CitiesNavigation
    case CityDetail
    case SettingsController
}

extension UIStoryboard {
    class func instantiateController(forModule module: StoryboardModule, vcIdentifier: Controller) -> UIViewController {
        let storyboard = UIStoryboard.init(name: module.rawValue, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: vcIdentifier.rawValue)
        return controller
    }
}
