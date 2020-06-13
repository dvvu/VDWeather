//
//  BaseProtocol.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

@objc protocol BaseDelegate: class {
    @objc optional func ativityLoading(_ isShow: Bool)
}
