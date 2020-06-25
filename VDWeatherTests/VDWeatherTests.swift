////
////  VDWeatherTests.swift
////  VDWeatherTests
////
////  Created by Vu Doan on 6/9/20.
////  Copyright © 2020 Vu Doan. All rights reserved.
////
//
//import XCTest
//import Mockingjay
//@testable import VDWeather
//
////class HomeReposistoryFailed: HomeReposistoryProtocol {
////    func fetchWeather(keyword: String, completion: @escaping (BaseDataResponse<PredictionResult?>) -> Void) {
//////        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
////            completion(.failure(error: NSError(domain: "HELLO", code: 1001, userInfo: [:])))
//////        }
////    }
////}
////
////class HomeResposistorySuccess: HomeReposistoryProtocol {
////    func fetchWeather(keyword: String, completion: @escaping (BaseDataResponse<PredictionResult?>) -> Void) {
////        // Do something return completion success
////        completion(.success(result: nil))
////    }
////}
//
//class VDWeatherTests: XCTestCase {
//    var useCase: HomeUseCase?
//    
//    override func setUp() {
//        
//    }
//
//    override func tearDown() {
//        VDContainer.shared.dispose()
//    }
//    
//    func testFetchWeatherFailed() {
//        let expectation = XCTestExpectation(description: "testFetchWeatherFailed")
//        VDContainer.shared.add(type: HomeReposistoryProtocol.self) { _ in HomeReposistoryFailed() }
//        useCase = HomeUseCase()
//        useCase?.fechingData("TEST FAIL") { result in
//            var returnBool = false
//            switch result {
//            case .success(result: _):
//                returnBool = false
//            case .failure(error: _):
//                returnBool = true
//            }
//            XCTAssertTrue(returnBool)
//            
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 1.0)
//    }
//
//    func testFetchWeatherSuccess() {
//        let expectation = XCTestExpectation(description: "testFetchWeatherSuccess")
//        
//        VDContainer.shared.add(type: HomeReposistoryProtocol.self) { _ in HomeResposistorySuccess() }
//        useCase = HomeUseCase()
//        useCase?.fechingData("TEST SUCCESS") { result in
//            var returnBool = false
//            switch result {
//            case .success(result: _):
//                returnBool = true
//            case .failure(error: _):
//                returnBool = false
//            }
//            XCTAssertTrue(returnBool)
//            expectation.fulfill()
//        }
//    }
//}
