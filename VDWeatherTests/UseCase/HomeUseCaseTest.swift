//
//  HomeUseCase.swift
//  VDWeatherTests
//
//  Created by Vu Doan on 6/23/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import XCTest
import Mockingjay
@testable import VDWeather

// UseCase test
class HomeUseCaseTest: XCTestCase {
    var useCase: HomeUseCaseProvider?
    var stubApi: String!
    
    override func setUp() {
        stubApi = TestUtils.shared.getWeatherUrl(
            keyword: "saigon",
            days: VDAccountManager.shared.dayCount,
            tempType: VDAccountManager.shared.temperatureType.rawValue
        )
        VDContainer.shared.add(type: HomeUseCaseProvider.self) { _ in HomeUseCase() }
        VDContainer.shared.add(type: HomeReposistoryProtocol.self) { _ in HomeReposistory() }
        useCase = VDContainer.shared.resolve(HomeUseCaseProvider.self)
    }
    
    func testHomeUseCaseSuccess() {
        let expectation = XCTestExpectation(description: "testHomeUseCaseSuccess")
        self.stubRequest(stubApi, fileName: "weather_success")
    
        useCase?.fechingData("saigon", completion: { (results) in
            if case let .success(result: predictions) = results {
                XCTAssert(predictions?.city?.name == "Vu Doan City")
                // Write what data you need to test
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
        self.removeAllStubs()
    }
    
    func testHomeUseCase404Fail() {
        let expectation = XCTestExpectation(description: "testHomeUseCase404Fail")
        self.stubRequest(stubApi, fileName: "weather_fail")
    
        useCase?.fechingData("saigon", completion: { (results) in
            if case let .failure(error: error) = results {
                XCTAssert(error.localizedDescription == "city not found")
                // Write what data you need to test
            }

            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
        self.removeAllStubs()
    }
    
    func testHomeUseCaseEmptyFail() {
        let expectation = XCTestExpectation(description: "testHomeUseCaseEmptyFail")
        self.stubRequest(stubApi, fileName: "weather_fail")
    
        useCase?.fechingData("saigon", completion: { (results) in
            if case let .failure(error: error) = results {
                XCTAssert(error.localizedDescription == "city not found")
                // Write what data you need to test
            }

            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
        self.removeAllStubs()
    }
}
