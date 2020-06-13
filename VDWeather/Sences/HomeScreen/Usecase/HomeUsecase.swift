//
//  HomeUsecase.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

protocol HomeUseCaseProvider {
    func fechingData(_ params: [String: Any]?) -> String
}

class HomeUseCase: HomeUseCaseProvider {
    func fechingData(_ params: [String : Any]?) -> String {
        return "test"
    }
}
