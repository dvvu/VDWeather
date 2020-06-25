//
//  BaseRepository.swift
//  VDWeather
//
//  Created by Vu Doan on 6/10/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import ObjectMapper

enum BaseDataResponse<T> {
    case success(result: T)
    case failure(error: Error)
}

