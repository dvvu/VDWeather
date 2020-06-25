//
//  TestUtils.swift
//  VDWeatherTests
//
//  Created by Vu Doan on 6/23/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import XCTest
import Mockingjay
@testable import VDWeather

class TestUtils: XCTestCase {
    static let shared = TestUtils()
    
    func getWeatherUrl(keyword: String, days: Int, tempType: String) -> String {
        return "\(VDNetworkConstant.endPoint)forecast/daily?q=\(keyword)&cnt=\(days)&appid=\(VDNetworkConstant.appId)&units=\(tempType)"
    }
}

extension XCTestCase {
    func stubRequest(_ urlString: String, fileName: String) {
        if let url = Bundle(for: TestUtils.self).url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) {
            stub(http(.get, uri: urlString), jsonData(data))
        }
    }
}

