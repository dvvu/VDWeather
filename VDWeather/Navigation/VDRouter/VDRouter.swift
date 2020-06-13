//
//  VDRouter.swift
//  VDBase
//
//  Created by Vu Doan on 4/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

@objcMembers
public class VDRouter: NSObject {
    
    /// Router item for handler
    struct VDRouterItem {
        var module: String
        var url: String
        var handlerClass: AnyClass
    }
    
    /// List of registered router items
    private static var routerItems: [VDRouterItem] = []
    
    public class func register(module: String, mapping: [String: AnyClass]) {
        mapping.forEach { (url, handlerClass) in
            let routerItem = VDRouterItem(module: module, url: url, handlerClass: handlerClass)
            routerItems.append(routerItem)
        }
    }

    @objc public class func open(_ urlString: String, settings: VDRouterItemSettingProtocol?) {
        guard let vc = viewController(urlString, settings: settings) else { return }
        if settings?.type == .root {
            VDRouterUtilities.setRoot(viewController: vc)
        } else if settings?.type == .present {
            vc.modalPresentationStyle = .fullScreen
            VDRouterUtilities.present(viewController: vc)
        } else {
            VDRouterUtilities.push(viewController: vc)
        }
    }
    
    public class func viewController(_ urlString: String, settings: VDRouterItemSettingProtocol? = nil) -> UIViewController? {
        for routerItem in routerItems {
            if urlString.hasPrefix(routerItem.url) {
                if let cls = routerItem.handlerClass as? VDRouterProtocol.Type {
                    if let vc = cls.viewController(urlString: urlString, settings: settings) {
                        return vc
                    }
                } else if let cls = routerItem.handlerClass as? UIViewController.Type {
                    let vc = cls.init(nibName: nil, bundle: nil)
                    return vc
                }
            }
        }
        
        return nil
    }
    
    public class func backToRoot(animated: Bool = false, completion: VDRouterUtilities.VoidCallback? = nil) {
        VDRouterUtilities.backToRoot(animated: animated, completion: completion)
    }
}


