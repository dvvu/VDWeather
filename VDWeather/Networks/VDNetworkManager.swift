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
    private var sessionManager = SessionManager()
    typealias SuccessHandler = (Any) -> Void
    typealias FailureHandler = (Error) -> Void
    
    override init() {
        super.init()
        // configuration network
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        self.sessionManager = Alamofire.SessionManager(configuration: config)
    }
    
    private func getHeader(enableHeader: Bool) -> HTTPHeaders? {
        if enableHeader {
            return ["Authorization": "Bearer " + "token if need",
                    "api-version": "2.0",
                    "Content-Type": "application/json"]
        }
        return ["Content-Type": "application/json"]
    }
    
    func requestAPI(_ endpoint: String, params: [String: Any]? = nil, isFullLink: Bool? = nil, method: HTTPMethod, enableHeader: Bool? = nil, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        var urlString = ""
        if isFullLink == true {
            urlString = endpoint
        } else {
            urlString = "\(VDNetworkConstant.endPoint)\(endpoint)"
        }
        self.sessionManager.request(urlString, method: method, parameters: params, encoding: JSONEncoding.default, headers: self.getHeader(enableHeader: enableHeader ?? false)).responseJSON { (response) in

            if response.result.isSuccess, let value = response.result.value {
                let json = JSON(value)
                let statusCode = json["cod"].intValue
                if statusCode == 200 {
                    success(value)
                } else {
                    // business error
                    let message = json["message"].string ?? "pu_unknow_error".localized
                    let error = NSError(domain: "pu_title".localized, code: statusCode, userInfo: [ NSLocalizedDescriptionKey: message])
                    self.processError(error: error)
                    failure(error)
                }
            } else {
                // network error
                if let error: Error = response.result.error {
                    self.internetConnectionFaild(error: error as NSError)
                    failure(error)
                } else {
                    let error = NSError(domain: "pu_unknow_error".localized, code: 600, userInfo: [:])
                    failure(error)
                }
            }
        }
    }
    
    private func processError(error: NSError) {
        if error.code == VDERROR_CODE.invalidToken {
            NotificationCenter.default.post(name: VDNOTIFICATION_NAME.invalidToken, object: nil)
        }
    }
    
    private func internetConnectionFaild(error: NSError) {
        if error.code == VDERROR_CODE.notConnection {
            NotificationCenter.default.post(name: VDNOTIFICATION_NAME.internetConnectionFaild, object: nil)
        }
    }
}

