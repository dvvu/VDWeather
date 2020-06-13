//
//  VDRouterUtilities.swift
//  VDBase
//
//  Created by Vu Doan on 4/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

public class VDRouterUtilities {
    public typealias VoidCallback = () -> Void
    
    public class func setRoot(viewController: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    public class func push(viewController: UIViewController, animated: Bool = true, completion: VoidCallback? = nil) {
        topViewController()?.navigationController?.pushViewController(viewController, animated: animated, completion: completion)
    }
    
    public class func present(viewController: UIViewController, animated: Bool = true, completion: VoidCallback? = nil) {
        topViewController()?.present(viewController, animated: animated, completion: completion)
    }
    
    public class func dismiss(animated: Bool = false, completion: VoidCallback? = nil) {
        topViewController()?.dismiss(animated: animated, completion: completion)
    }
    
    public class func back(animated: Bool = false, completion: VoidCallback? = nil) {
        guard let top = topViewController() else { return }
        back(from: top, animated: animated, completion: completion)
    }
    
    public class func backToRoot(animated: Bool = false, completion: VDRouterUtilities.VoidCallback? = nil) {
        guard let root = VDRouterUtilities.rootViewController else { return }
        
        if let tab = root as? UITabBarController, let selected = tab.selectedViewController {
            if selected.presentedViewController != nil {
                selected.dismiss(animated: animated) {
                    if let nav = selected as? UINavigationController {
                        nav.popToRootViewController(animated: false, completion: completion)
                        return
                    }
                    completion?()
                }
                return
            }
            
            if let nav = selected as? UINavigationController {
                nav.popToRootViewController(animated: animated, completion: completion)
            }
        }
        else if let nav = root as? UINavigationController {
            nav.popToRootViewController(animated: animated, completion: completion)
        }
        else {
            completion?()
        }
   }
    
    public class func topViewController(_ base: UIViewController? = VDRouterUtilities.rootViewController) -> UIViewController? {
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
    
    public class var rootViewController: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }
    
    
    // MARK: - Private methods
    
    private class func back(from base: UIViewController? = topViewController(), animated: Bool = false, completion: VoidCallback? = nil) {
        guard let vc = base else { return }
        
        if let _ = vc.presentingViewController {
            vc.dismiss(animated: animated, completion: completion)
            return
        }
        
        if let nav = vc.navigationController {
            if nav.viewControllers.count > 1 {
                nav.popViewController(animated: animated, completion: completion)
            }
            else if let _ = nav.presentingViewController {
                nav.dismiss(animated: animated, completion: completion)
            }
        }
    }
}

extension UINavigationController {
    public func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if !animated {
                self.pushViewController(viewController, animated: false)
                completion?()
                return
            }
            
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.pushViewController(viewController, animated: animated)
            CATransaction.commit()
        }
    }
    
    public func popViewController(animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if self.viewControllers.count == 1 {
                completion?()
                return
            }
            
            if !animated {
                self.popViewController(animated: false)
                completion?()
                return
            }
            
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.popViewController(animated: animated)
            CATransaction.commit()
        }
    }

    public func popToRootViewController(animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if self.viewControllers.count == 1 {
                completion?()
                return
            }
            
            if !animated {
                self.popToRootViewController(animated: false)
                completion?()
                return
            }
            
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.popToRootViewController(animated: animated)
            CATransaction.commit()
        }
    }
}
