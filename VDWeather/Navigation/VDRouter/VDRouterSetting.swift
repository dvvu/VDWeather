//
//  VDRouterSetting.swift
//  VDBase
//
//  Created by Vu Doan on 4/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

public typealias VDRouterCallback = (Any?) -> Void
/// Router item types
@objc public enum VDRouterItemType: Int {
    /// Root view controller
    case root
    /// Push view controller
    case push
    /// Present new controller
    case present
}

/// Protocol to determine view controller type & inject dependencies or not
@objc public protocol VDRouterItemSettingProtocol {
    @objc var type: VDRouterItemType { get }
    @objc var params: Any? { get set }
    @objc var callback: VDRouterCallback? { get set }
}

/// Router item settings
@objcMembers
public class VDRouterItemSetting: NSObject, VDRouterItemSettingProtocol {
    /// Allow set root, push or present view controller
    @objc public var type: VDRouterItemType
    /// Additional parameters pass into new view controller
    @objc public var params: Any?
    /// Callback for receiver
    @objc public var callback: VDRouterCallback?
    
    @objc public init(_ type: VDRouterItemType = .push, params: Any? = nil, callback: VDRouterCallback? = nil) {
        self.type = type
        self.params = params
        self.callback = callback
    }
}
