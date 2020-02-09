//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupWindow()
        return true
    }
    
    private func setupWindow() {
        let citiesController = UIStoryboard.instantiateController(forModule: .Main, vcIdentifier: .CitiesNavigation)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = citiesController
        window?.makeKeyAndVisible()
    }

}

