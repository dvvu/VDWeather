//
//  FeelLikeModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

class FeelLikeModel: Mappable {
    var day: Float?
    var night: Float?
    var eve: Float?
    var morn: Float?
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        day <- map["day"]
        night <- map["night"]
        eve <- map["eve"]
        morn <- map["morn"]
    }
}
