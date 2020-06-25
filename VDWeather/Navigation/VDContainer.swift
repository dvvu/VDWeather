//
//  VDContainer.swift
//  VDWeather
//
//  Created by Vu Doan on 6/24/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

public class VDContainer: ModuleContainerProtocol {
    public var container: ContainerProtocol = DependencyContainer.shared
    static public var module: String = "HomeModule"
    private init() {}
    public static var shared = VDContainer()
}

public extension VDContainer {
    func initDependency() {
        VDContainer.shared.add(type: HomeReposistoryProtocol.self) { _ in HomeReposistory() }
        VDContainer.shared.add(type: SettingReposistoryProtocol.self) { _ in SettingReposistory() }

        VDContainer.shared.add(type: HomeUseCaseProvider.self) { _ in HomeUseCase() }
        VDContainer.shared.add(type: SettingUseCaseProvider.self){ _ in SettingUseCase() }
               
        VDContainer.shared.add(type: HomeViewModel.self) { _ in HomeViewModel() }
    }
}
