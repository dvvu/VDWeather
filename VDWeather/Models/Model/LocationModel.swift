//
//  LocationModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationModel: Mappable {
    var lat: CGFloat?
    var long: CGFloat?
   
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        lat <- map["lat"]
        long <- map["lon"]
    }
}
