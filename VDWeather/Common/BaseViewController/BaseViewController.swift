//
//  BaseViewController.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // netword connection
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.setLanguage), name: VDNOTIFICATION_NAME.localize, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.internetConnectionFaild), name: VDNOTIFICATION_NAME.internetConnectionFaild, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.retry), name: VDNOTIFICATION_NAME.retryAPI, object: nil)
    }
    
    @objc func setLanguage() {}
    
    @objc func internetConnectionFaild() {
        let alert = UIAlertController(title: "base_no_connection_title".localized, message: "base_no_connection_message".localized, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "dialog_retry_button".localized, style: .default, handler: {  (_) in
            NotificationCenter.default.post(name: VDNOTIFICATION_NAME.retryAPI, object: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "dialog_exit_button".localized, style: .default, handler: { (_) in
            exit(0)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func retry() {}
    
    func showMessage(title: String, message: String, completion: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dialog_ok_button".localized, style: .default, handler: {  (_) in
            completion()
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

