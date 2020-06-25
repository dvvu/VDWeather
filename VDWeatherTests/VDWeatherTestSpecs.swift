////
////  VDWeatherTestSpecs.swift
////  VDWeatherTests
////
////  Created by Vu Doan on 6/12/20.
////  Copyright © 2020 Vu Doan. All rights reserved.
////
//
//import Foundation
//import Quick
//import Nimble
//import Mockingjay
//@testable import VDWeather
//
//class WeatherTestSpec: QuickSpec {
//    override func spec() {
//        describe("Weather test") {
//            var useCase: HomeUseCase?
//            let stubApi: String = TestUtils.shared.getWeatherUrl(
//                keyword: "saigon",
//                days: VDAccountManager.shared.dayCount,
//                tempType: VDAccountManager.shared.temperatureType.rawValue
//            )
//            beforeEach {
//                VDContainer.shared.add(type: HomeReposistoryProtocol.self) { _ in HomeReposistory() }
//                useCase = HomeUseCase()
//            }
//            
//            afterEach {
//                self.removeAllStubs()
//                useCase = nil
//            }
//            
//            context("when call API success") {
//                beforeEach {
//                    self.stubRequest(stubApi, fileName: "weather_success")
//                }
//                
//                it("should be return valid result") {
//                    waitUntil { done in
//                        useCase?.fechingData("saigon", completion: { result in
//                            if case let .success(result: predictions) = result {
//                                expect(predictions?.city?.name ?? "").to(equal("Vu Doan City"))
//                                // Write what data you need to test
//                            }
//                            done()
//                        })
//                    }
//                }
//            }
//            
//            context("when call API failed") {
//                beforeEach {
//                    self.stub(http(.get, uri: stubApi)) { request -> (Response) in
//                        return .failure(NSError(domain: "Hello Test", code: 1001, userInfo: [:]))
//                    }
//                }
//                
//                it("should be return fail result") {
//                    waitUntil { done in
//                        useCase?.fechingData("saigon", completion: { result in
//                            if case let .failure(error: error) = result {
//                                expect(error.localizedDescription).to(equal("The operation couldn’t be completed. (Hello Test error 1001.)"))
//                            }
//                            done()
//                        })
//                    }
//                }
//            }
//        }
//    }
//}
