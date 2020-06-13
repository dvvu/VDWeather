//
//  TempModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

class TempModel: Mappable {
    var day: Float?
    var min: Float?
    var max: Float?
    var night: Float?
    var eve: Float?
    var morn: Float?
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        day <- map["day"]
        min <- map["min"]
        max <- map["max"]
        night <- map["night"]
        eve <- map["eve"]
        morn <- map["morn"]
    }
}

extension TempModel {
    func getAvegaeTemp() -> String {
        var unit = ""
        switch VDAccountManager.shared.temperatureType {
        case .Celsius:
            unit = "setting_c".localized
            break
        case .Fahrenheit:
            unit = "setting_f".localized
            break
        default:
            unit = "setting_k".localized
            break
        }
        return "\(Int((max ?? 0) + (min ?? 0))/2)\(unit)"
    }
}
