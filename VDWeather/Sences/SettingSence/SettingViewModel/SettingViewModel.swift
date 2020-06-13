//
//  SettingViewModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/13/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

protocol SettingViewModelDelegate: BaseDelegate {
    func dayCount()
    func temperature()
    func save()
    func failed(_ error: Error)
}

class SettingViewModel: BaseViewModel {
    private var useCase: SettingUseCase?
    weak var delegate: SettingViewModelDelegate?
    // default of caching
    var results = SettingModel(VDAccountManager.shared.dayCount, temperatureType:  VDAccountManager.shared.temperatureType)
    
    init(_ useCase: SettingUseCase) {
        self.useCase = useCase
    }
    
    func selectTemperature(_ type: TemperatureType) {
        guard let useCase = useCase, let delegate = delegate else { return }
        useCase.selectTemperature(type, model: results, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.results.temperatureType = value?.temperatureType
                delegate.temperature()
                break
            case .failure(let error):
                delegate.failed(error)
                break
            }
        })
    }
    
    func dayCount(_ isPlus: Bool) {
        guard let useCase = useCase, let delegate = delegate else { return }
        useCase.dayCount(isPlus, model: results, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.results.dayCount = value?.dayCount
                delegate.dayCount()
                break
            case .failure(let error):
                delegate.failed(error)
                break
            }
        })
    }
    
    func save() {
        guard let useCase = useCase, let delegate = delegate else { return }
        useCase.save(results, completion: { result in
            switch result {
            case .success(_):
                delegate.save()
                break
            case .failure(let error):
                delegate.failed(error)
                break
            }
        })
    }
}
