//
//  VDNavigationController.swift
//  VDWeather
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

// Delegate we can implement in main controller
@objc protocol VDNavigationController {
    @objc func settingClick(sender: UIBarButtonItem)
}

extension VDNavigationController where Self: UIViewController {
    func configureNavigationBar() {
        if let navigationController = navigationController {
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.barTintColor = UIColor.blue
            let myimage = UIImage(named: "ic_setting")?.withRenderingMode(.alwaysOriginal)
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(settingClick))
        }
    }
}
