//
//  Localize+Extension.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    @IBInspectable
    open var localize: String {
        get {
            return self.localize
        }
        set(value) {
            self.text = value.localized
        }
    }
}

extension UITextField {
    @IBInspectable
    open var localize: String {
        get {
            return self.localize
        }
        set(value) {
            self.placeholder = value.localized
        }
    }
}

extension UIButton {
    @IBInspectable
    open var localize: String {
        get {
            return self.localize
        }
        set(value) {
            self.setTitle(value.localized, for: .normal)
        }
    }
}
