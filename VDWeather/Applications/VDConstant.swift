//
//  VDConstant.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

class VDNetworkConstant {
    static var endPoint = "https://api.openweathermap.org/data/2.5/"
    static var appId = "60c6fbeb4b93ac653c492ba806fc346d"
}

class VDConstant {
    static var keyDayCount = "DAYCOUNT"
    static var keyDayTemperatureType = "TEMPERATURETYPE"
    static var keyLanguage = "LANGUAGE"
}

class VDNOTIFICATION_NAME {
    // server business
    static let invalidToken = NSNotification.Name(rawValue: "NTF_INVALID_TOKEN")
    static let internetConnectionFaild = NSNotification.Name(rawValue: "NTF_INTERNET_CONNECTION_FAILD")
    static let retryAPI = NSNotification.Name(rawValue: "NTF_RETRY_API")
    // app local
    static let localize = NSNotification.Name(rawValue: "NTF_LOCALIZE")
}

class VDERROR_CODE {
    static let invalidToken = 401
    static let notConnection = -1009
}
