//
//  HomeViewModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: BaseDelegate {
    func reload()
    func failed(_ error: Error)
}

class HomeViewModel: BaseViewModel {
    private var useCase: HomeUseCaseProvider?
    weak var delegate: HomeViewModelDelegate?
    var results: PredictionResult?
    
    override init() {
        self.useCase = VDContainer.shared.resolve(HomeUseCaseProvider.self)
    }
    
    func fechingData(_ searchString: String) {
        showLoading(true)
        guard let useCase = self.useCase , let delegate = delegate else { return }
        useCase.fechingData(searchString, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.results = value
                delegate.reload()
                self.showLoading(false)
                break
            case .failure(let error):
                delegate.failed(error)
                self.showLoading(false)
                break
            }
        })
    }
    
    private func showLoading(_ isShow: Bool) {
        if let delegate = self.delegate {
            delegate.ativityLoading?(isShow)
        }
    }
}
