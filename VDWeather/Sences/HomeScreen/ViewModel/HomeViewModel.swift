//
//  HomeViewModel.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {
    func reload()
}

class HomeViewModel: BaseViewModel {
    private var useCase: HomeUseCase?
    weak var delegate: HomeViewModelDelegate?
   
    init(_ useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    func fechingData() {
        NetworkManager.shareInstance.requestAPI(urlString: "https://api.openweathermap.org/data/2.5/forecast/daily?q=saigon&cnt=7&appid=60c6fbeb4b93ac653c492ba806fc346d&units=metric", params: nil, method: .get, enableHeader: false, success: { (response) in
            print(response)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func searchWithKey(_ keyString: String) {
        
    }
}
