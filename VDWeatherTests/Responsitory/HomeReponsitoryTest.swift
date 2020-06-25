//
//  HomeReponsitoryTest.swift
//  VDWeatherTests
//
//  Created by Vu Doan on 6/24/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import XCTest
import Mockingjay
@testable import VDWeather

class HomeReposistoryFailed: HomeReposistoryProtocol {
    func fetchWeather(keyword: String, completion: @escaping (BaseDataResponse<PredictionResult?>) -> Void) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(.failure(error: NSError(domain: "HELLO", code: 1001, userInfo: [:])))
//        }
    }
}

class HomeResposistorySuccess: HomeReposistoryProtocol {
    func fetchWeather(keyword: String, completion: @escaping (BaseDataResponse<PredictionResult?>) -> Void) {
        // Do something return completion success
        completion(.success(result: nil))
    }
}

class HomeReponsitoryTest: XCTestCase {
    var reposistory: HomeReposistoryProtocol?
    
    override func setUp() {
    }
    
    override func tearDown() {
        VDContainer.shared.dispose()
    }
    
    func testReponsitorySuccess() {
        VDContainer.shared.add(type: HomeReposistoryProtocol.self) { _ in HomeResposistorySuccess() }
        reposistory = VDContainer.shared.resolve(HomeReposistoryProtocol.self)
        let expectation = XCTestExpectation(description: "testReponsitorySuccess")
        reposistory?.fetchWeather(keyword: "saigon", completion: { (results) in
            var returnBool = false
            if case .success(result: _) = results {
                returnBool = true
            }

            XCTAssertTrue(returnBool)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
    }

    func testHomeUseCase404Fail() {
        VDContainer.shared.add(type: HomeReposistoryProtocol.self) { _ in HomeReposistoryFailed() }
        reposistory = VDContainer.shared.resolve(HomeReposistoryProtocol.self)
        let expectation = XCTestExpectation(description: "testHomeUseCase404Fail")
        reposistory?.fetchWeather(keyword: "saigonn", completion: { (results) in
            var returnBool = false
            if case .failure(error: _) = results {
                returnBool = true
            }

            XCTAssertTrue(returnBool)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
    }
}
