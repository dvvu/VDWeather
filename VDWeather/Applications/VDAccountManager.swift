//
//  VDAccountManager.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

class VDAccountManager: NSObject {
    static let shared = VDAccountManager()
    
    // handle day count
    var dayCount: Int = 7 {
        didSet {
            let userDef = UserDefaults.standard
            userDef.setValue(dayCount, forKey: VDConstant.keyDayCount)
        }
    }
    
    // handle temperature type
    var temperatureType: TemperatureType = .Kelvin {
        didSet {
            let userDef = UserDefaults.standard
            userDef.setValue(temperatureType.rawValue, forKey: VDConstant.keyDayTemperatureType)
        }
    }
    
    // current language code
    private var language: String = "en" {
        didSet {
            let userDef = UserDefaults.standard
            userDef.setValue(language, forKey: VDConstant.keyLanguage)
        }
    }
    
    override init() {
        super.init()
        self.loadDefault()
    }
    
    func loadDefault() {
        let userDef = UserDefaults.standard
        if let dayCount =  userDef.object(forKey: VDConstant.keyDayCount) as? Int {
            self.dayCount = dayCount
        }
        
        if let temperatureType =  userDef.object(forKey: VDConstant.keyDayTemperatureType) as? TemperatureType {
            self.temperatureType = temperatureType
        }
        
        if let language = userDef.object(forKey: VDConstant.keyLanguage) as? String {
            self.language = language
        } else {
            self.language = "en"
        }
        // listen invalid token
        NotificationCenter.default.addObserver(self, selector: #selector(VDAccountManager.forceLogout), name: VDNOTIFICATION_NAME.invalidToken, object: nil)
    }
    
    @objc func forceLogout() {
        
    }
}
