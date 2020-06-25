//
//  Error+Extension.swift
//  VDWeather
//
//  Created by Vu Doan on 6/24/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
