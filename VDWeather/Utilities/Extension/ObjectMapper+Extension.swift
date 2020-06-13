//
//  ObjectMapper+Extension.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

public let transformAnyToString = TransformOf<String, Any>(fromJSON: { (value: Any?) -> String? in
    if let value = value {
        if value is NSNumber {
            let numberValue = value as! NSNumber
            return numberValue.stringValue
        } else if value is String {
            return value as? String
        }
    }
    return ""
}, toJSON: { (value: String?) -> String? in
    return value
})
