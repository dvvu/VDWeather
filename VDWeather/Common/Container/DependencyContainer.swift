//
//  DependencyContainer.swift
//  VDWeather
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

public protocol ResolverType {
    func resolve<Component>(_ type: Component.Type, module: String) -> Component?
}

public protocol ModuleContainerProtocol {
    var container: ContainerProtocol { get }
    static var module: String { get }
    func resolve<Component>(_ type: Component.Type) -> Component?
    func add(type: Any.Type, _ factory: @escaping (ResolverType) -> Any)
    func dispose()
}

public extension ModuleContainerProtocol {
    func resolve<Component>(_ type: Component.Type) -> Component? {
        self.container.resolve(type, module: Self.module)
    }

    func add(type: Any.Type, _ factory: @escaping (ResolverType) -> Any) {
        self.container.add(type: type, module: Self.module, factory)
    }
    
    func dispose() {
        self.container.dispose()
    }
}

public protocol ContainerProtocol: ResolverType {
    static var shared: ContainerProtocol { get }
    func add(type: Any.Type, module: String, _ factory: @escaping (ResolverType) -> Any)
    func dispose()
}

public class DependencyContainer: ContainerProtocol {
    public func dispose() {
        factoryDict = [:]
    }
    
    public static let shared: ContainerProtocol = DependencyContainer()
    var factoryDict: [String: (ResolverType) -> Any] = [:]
    
    private func getKey(_ type: Any.Type, module: String) -> String {
        return "\(module)_\(String(describing: type.self))"
    }
    
    public func add(type: Any.Type, module: String, _ factory: @escaping (ResolverType) -> Any) {
        factoryDict[getKey(type, module: module)] = factory
    }
    
    public func resolve<Component>(_ type: Component.Type, module: String) -> Component? {
        let componentName = getKey(type, module: module)
        if let component = factoryDict[componentName]?(self) as? Component {
            NSLog("DI Container: successfully get component: \(componentName)")
            return component
        }
        
        NSLog("DI Container: unable to resolve component: \(componentName)")
        return nil
    }
}
















