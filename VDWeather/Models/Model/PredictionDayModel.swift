//
//  PredictionDayModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

class PredictionDayModel: Mappable {
    var dt: TimeInterval?
    var sunrise: TimeInterval?
    var sunset: TimeInterval?
    var pressure: Int?
    var humidity: Int?
    var speed: Int?
    var deg: Int?
    var clouds: Int?
    var rain: Int?
    var weathers: [WeatherModel]?
    var temp: TempModel?
    var feelLike: FeelLikeModel?
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        dt <- map["dt"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        speed <- map["speed"]
        deg <- map["deg"]
        clouds <- map["clouds"]
        rain <- map["rain"]
        weathers <- map["weather"]
        temp <- map["temp"]
        feelLike <- map["feels_like"]
    }
}
