//
//  VDTests2.swift
//  VDWeatherTests
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import XCTest
import Mockingjay
@testable import VDWeather

class VDTests2: XCTestCase {
    var useCase: HomeUseCase?
    let stubApi: String = "\(VDNetworkConstant.endPoint)forecast/daily?q=saigon&cnt=7&appid=\(VDNetworkConstant.appId)&units=metric"
    
    override func setUp() {
        DependencyContainer.shared.add(type: HomeReposistoryProtocol.self) { HomeReposistory() }
         useCase = HomeUseCase()
    }
    
    override func tearDown() {
        
    }
    
    func testNetworkWeather() {
        let expectation = XCTestExpectation(description: "Test case Success")
        stubRequest(stubApi, fileName: "weather_success")
        useCase?.fechingData("saigon", completion: { result in
            
            if case let .success(result: predictions) = result {
                XCTAssert(predictions?.city?.name == "Vu Doan City")
                // Write what data you need to test
            }
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func stubRequest(_ urlString: String, fileName: String) {
      let url = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json")!
      let data = try! Data(contentsOf: url)
      stub(http(.get, uri: urlString), jsonData(data))
    }
}
