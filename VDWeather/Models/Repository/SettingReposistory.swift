//
//  SettingReposistory.swift
//  VDWeather
//
//  Created by Vu Doan on 6/13/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

protocol SettingReposistoryProtocol {
    func selectTemperature(_ temperatureType: TemperatureType, model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void)
    func dayCount(_ isPlus: Bool, model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void)
    func save(_ model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void)
}

class SettingReposistory: SettingReposistoryProtocol {
    func selectTemperature(_ temperatureType: TemperatureType, model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void) {
        model.temperatureType = temperatureType
        // can extend to have new bussiness logic
        completion(.success(result: model))
    }
    
    func dayCount(_ isPlus: Bool, model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void) {
        var caculaDay: Int = model.dayCount ?? 0
        if isPlus {
            caculaDay += 1
        } else {
            if caculaDay - 1 < 1 {
                 completion(.failure(error: NSError(domain: "setting_min_day".localized, code: 901, userInfo: [:])))
            } else {
                caculaDay -= 1
            }
        }
        model.dayCount = caculaDay
        completion(.success(result: model))
    }
    
    func save(_ model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void) {
        if let dayCount = model.dayCount, let temp = model.temperatureType {
            VDAccountManager.shared.dayCount = dayCount
            VDAccountManager.shared.temperatureType = temp
             // can extend to have new bussiness logic
            completion(.success(result: model))
        } else {
            completion(.failure(error: NSError(domain: "setting_error_nil_object".localized, code: 999, userInfo: [:])))
        }
    }
}
