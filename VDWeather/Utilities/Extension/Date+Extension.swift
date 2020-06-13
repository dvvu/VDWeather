//
//  Date+Extension.swift
//  VDWeather
//
//  Created by Vu Doan on 6/13/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

extension Date {
    func daytoString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MM yyyy"
        return dateFormatter.string(from: self).capitalized
    }
}
