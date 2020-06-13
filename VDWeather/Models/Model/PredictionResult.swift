//
//  PredictionResult.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

class PredictionResult: Mappable {
    var city: CityModel?
    var days: [PredictionDayModel]?
    var cod: String?
    var message: Float?
    var cnt: Int?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        city <- map["city"]
        days <- map["list"]
        cod <- map["cod"]
        message <- map["message"]
        cnt <- map["cnt"]
    }
}
