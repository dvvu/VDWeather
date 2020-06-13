//
//  AppDelegate.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18)!]
        VDRouterHandler.registerModule()
        self.registerDependencies()
        let viewModel = HomeViewModel(HomeUseCase())
        let vc = VDHomeScence.newInstance(viewModel: viewModel)
        let homeNavigationController = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = homeNavigationController
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func registerDependencies() {
        DependencyContainer.shared.add(type: HomeReposistoryProtocol.self) { HomeReposistory() }
        DependencyContainer.shared.add(type: SettingReposistoryProtocol.self) { SettingReposistory() }
    }
}


