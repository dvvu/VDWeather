//
//  WeatherModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherModel: Mappable {
    var id: String?
    var main: String?
    var description: String?
    var icon: String?
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        id <- (map["id"], transformAnyToString)
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}
