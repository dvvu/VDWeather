//
//  UIApplications+Extension.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
      class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
          if let nav = base as? UINavigationController {
              return topViewController(nav.visibleViewController)
          }
          if let tab = base as? UITabBarController {
              if let selected = tab.selectedViewController {
                  return topViewController(selected)
              }
          }
          if let presented = base?.presentedViewController {
              return topViewController(presented)
          }
          
          return base
      }
}
