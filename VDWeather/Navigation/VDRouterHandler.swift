//
//  VDRouterHandler.swift
//  VDWeather
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

/*
 With Navigator We can move A Repo to B Repo. If we implement VDRouterProtocol
 */
import Foundation
import UIKit

public class VDRouterHandler: VDRouterProtocol {
    public static func viewController(urlString: String, settings: VDRouterItemSettingProtocol?) -> UIViewController? {
        if urlString == "/weather/setting" {
            let vc = SettingSence.newInstance(viewModel: SettingViewModel(SettingUseCase()))
            return vc
        }
        return nil
    }
    /*
        Register to any Repo can understant
    */
    public class func registerModule() {
        VDRouter.register(module: "Setting", mapping: mapping)
    }
    
    private static var mapping: [String : AnyClass] {
        return [
            "/weather/setting": VDRouterHandler.self
        ]
    }
}


