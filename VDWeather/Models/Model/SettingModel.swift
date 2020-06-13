//
//  SettingModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/13/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

enum TemperatureType: String {
    case Celsius = "Metric"
    case Fahrenheit = "Imperial"
    case Kelvin = ""
}

class SettingModel {
    var dayCount: Int?
    var temperatureType: TemperatureType? = .Kelvin
    
    init(_ dayCount: Int, temperatureType: TemperatureType? = .Kelvin) {
        self.dayCount = dayCount
        self.temperatureType = temperatureType
    }
}
