//
//  HomeRepository.swift
//  VDWeather
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

protocol HomeReposistoryProtocol {
    func fetchWeather(keyword: String, completion: @escaping (BaseDataResponse<PredictionResult?>) -> Void)
}

class HomeReposistory: HomeReposistoryProtocol {
    private let networkService = NetworkManager.shareInstance
    
    func fetchWeather(keyword: String, completion: @escaping (BaseDataResponse<PredictionResult?>) -> Void) {
        let days = VDAccountManager.shared.dayCount
        let unit = VDAccountManager.shared.temperatureType.rawValue
        networkService.requestAPI("forecast/daily?q=\(keyword)&cnt=\(days)&appid=\(VDNetworkConstant.appId)&units=\(unit)", method: .get, success: { (response) in
            guard let object = Mapper<PredictionResult>().map(JSONObject: response) else {
                completion(.success(result: nil))
                return
            }
            completion(.success(result: object))
        }) { (error) in
            completion(.failure(error: error))
        }
    }
}
