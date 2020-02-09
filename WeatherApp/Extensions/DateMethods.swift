//
//  DateMethods.swift
//  WeatherApp
//
//  Created by Александр on 08.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

extension Date {
    
    static func dateFrom(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    static func dateAccordingToTimezone(seconds: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: seconds)
        return dateFormatter.string(from: Date())
    }
    
}
