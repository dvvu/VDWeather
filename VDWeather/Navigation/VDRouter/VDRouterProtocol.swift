//
//  VDRouterProtocol.swift
//  VDBase
//
//  Created by Vu Doan on 4/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

public protocol VDRouterProtocol {
    static func registerModule()
    static func viewController(urlString: String, settings: VDRouterItemSettingProtocol?) -> UIViewController?
}
