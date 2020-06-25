//
//  SettingUseCase.swift
//  VDWeather
//
//  Created by Vu Doan on 6/13/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

protocol SettingUseCaseProvider {
    func selectTemperature(_ temperatureType: TemperatureType, model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void)
    func dayCount(_ isPlus: Bool, model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void)
    func save(_ model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void)
}

class SettingUseCase: SettingUseCaseProvider {
    let resposistory = VDContainer.shared.resolve(SettingReposistoryProtocol.self)
    
    func save(_ model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void) {
        resposistory?.save(model, completion: completion)
    }
    
    func selectTemperature(_ temperatureType: TemperatureType, model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void) {
        resposistory?.selectTemperature(temperatureType, model: model, completion: completion)
    }
    
    func dayCount(_ isPlus: Bool, model: SettingModel, completion: @escaping (BaseDataResponse<SettingModel?>) -> Void) {
        resposistory?.dayCount(isPlus, model: model, completion: completion)
    }
}
