//
//  CityModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import CoreLocation
import ObjectMapper

class CityModel: Mappable {
    var id: String?
    var country: String?
    var name: String?
    var population: Int?
    var timeZone: Int?
    var coord: LocationModel?
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        id <- (map["id"], transformAnyToString)
        country <- map["country"]
        name <- map["name"]
        population <- map["population"]
        timeZone <- map["timezone"]
        coord <- map["coord"]
    }
}


