//
//  DependencyContainer.swift
//  VDWeather
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

public class DependencyContainer {
    public static let shared = DependencyContainer()
    var factoryDict: [String: () -> Any] = [:]
    public func add(type: Any.Type, _ factory: @escaping () -> Any) {
        factoryDict[String(describing: type.self)] = factory
    }
    public func resolve<Component>(_ type: Component.Type) -> Component {
        let component: Component = factoryDict[String(describing:Component.self)]?() as! Component
        return component
    }
}
















