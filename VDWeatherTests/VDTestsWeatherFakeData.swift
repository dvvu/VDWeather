////
////  VDTests2.swift
////  VDWeatherTests
////
////  Created by Vu Doan on 6/12/20.
////  Copyright © 2020 Vu Doan. All rights reserved.
////
//
//import Foundation
//import XCTest
//import Mockingjay
//@testable import VDWeather
//
//// Reposistory Test
//class VDTestsWeatherFakeData: XCTestCase {
//    var useCase: HomeUseCase?
//    var stubApi: String!
//
//    override func setUp() {
//        stubApi = TestUtils.shared.getWeatherUrl(
//            keyword: "saigon",
//            days: VDAccountManager.shared.dayCount,
//            tempType: VDAccountManager.shared.temperatureType.rawValue
//        )
////        VDContainer.shared.add(type: HomeReposistoryProtocol.self) { _ in HomeReposistory() }
//        useCase = HomeUseCase()
//    }
//
//    override func tearDown() {
//
//    }
//
//    func testNetworkWeather() {
//        let expectation = XCTestExpectation(description: "testNetworkWeather")
//        self.stubRequest(stubApi, fileName: "weather_success")
//        useCase?.fechingData("saigon", completion: { result in
//            if case let .success(result: predictions) = result {
//                XCTAssert(predictions?.city?.name == "Vu Doan City")
//                // Write what data you need to test
//            }
//            expectation.fulfill()
//        })
//
//        wait(for: [expectation], timeout: 1.0)
//    }
//}
