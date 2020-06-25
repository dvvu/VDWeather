//
//  HomeUsecase.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

protocol HomeUseCaseProvider {
    func fechingData(_ searchString: String, completion: @escaping (BaseDataResponse<PredictionResult?>) -> Void)
}

class HomeUseCase: HomeUseCaseProvider {
    let resposistory = VDContainer.shared.resolve(HomeReposistoryProtocol.self)
    
    func fechingData(_ searchString: String, completion: @escaping (BaseDataResponse<PredictionResult?>) -> Void) {
        resposistory?.fetchWeather(keyword: searchString, completion: completion)
    }
}
