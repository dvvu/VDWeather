//
//  VDNetworkManager.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager: NSObject {
    
    static let shareInstance = NetworkManager()
    private var sessionManager = Session()
    typealias SuccessHandler = (JSON) -> Void
    typealias FailureHandler = (Error) -> Void
    typealias SessionHandler = (Bool) -> Void
    
    override init() {
        super.init()
        // configuration network
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        self.sessionManager = Session(configuration: config)
    }
    
    private func getHeader(enableHeader: Bool) -> HTTPHeaders? {
        if enableHeader {
            return ["Authorization": "Bearer " + VDAccountManager.shared.token,
                    "api-version": "2.0",
                    "Content-Type": "application/json"]
        }
        return ["Content-Type": "application/json"]
    }
    
    func requestAPI(urlString: String, params: [String: Any]?, method: HTTPMethod, enableHeader: Bool, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        self.sessionManager.request(urlString, method: method, parameters: params, encoding: JSONEncoding.default, headers: self.getHeader(enableHeader: enableHeader)).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
                break
            case .failure(let error):
                self.internetConnectionFaild(error: error as NSError)
                self.processError(error: error as NSError)
                failure(error)
                break
            }
        }
    }
    
    private func processError(error: NSError) {
        if error.code == ERROR_CODE.invalidToken {
            NotificationCenter.default.post(name: NOTIFICATION_NAME.invalidToken, object: nil)
        }
    }
    
    private func internetConnectionFaild(error: NSError) {
        if error.code == ERROR_CODE.notConnection {
            NotificationCenter.default.post(name: NOTIFICATION_NAME.internetConnectionFaild, object: nil)
        }
    }
}

