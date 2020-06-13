//
//  VDWeatherTestSpecs.swift
//  VDWeatherTests
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Mockingjay
@testable import VDWeather

class WeatherTestSpec: QuickSpec {
    override func spec() {
        describe("Weather test") {
            var useCase: HomeUseCase?
            let stubApi: String = "\(VDNetworkConstant.endPoint)forecast/daily?q=saigon&cnt=7&appid=\(VDNetworkConstant.appId)&units=metric"
            beforeEach {
                DependencyContainer.shared.add(type: HomeReposistoryProtocol.self) { HomeReposistory() }
                useCase = HomeUseCase()
            }
            
            afterEach {
                self.removeAllStubs()
                useCase = nil
            }
            
            context("when call API success") {
                beforeEach {
                    self.stubRequest(stubApi, fileName: "weather_success")
                }
                
                it("should be return valid result") {
                    waitUntil { done in
                        useCase?.fechingData("saigon", completion: { result in
                            if case let .success(result: predictions) = result {
                                expect(predictions?.city?.name ?? "").to(equal("Vu Doan City"))
                                // Write what data you need to test
                            }
                            done()
                        })
                    }
                }
            }
            
            context("when call API failed") {
                beforeEach {
                    self.stub(http(.get, uri: stubApi)) { request -> (Response) in
                        return .failure(NSError(domain: "Hello dcmm", code: 1001, userInfo: [:]))
                    }
                }
                
                it("should be return fail result") {
                    waitUntil { done in
                        useCase?.fechingData("saigon", completion: { result in
                            if case let .failure(error: error) = result {
                                expect(error.localizedDescription).to(equal("URLSessionTask failed with error: The operation couldn’t be completed. (Hello dcmm error 1001.)"))
                            }
                            done()
                        })
                    }
                }
            }
        }
    }
    
    func stubRequest(_ urlString: String, fileName: String) {
        if let url = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) {
            stub(http(.get, uri: urlString), jsonData(data))
        }
    }
}
