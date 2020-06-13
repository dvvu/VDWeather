//
//  VDQueueAlert.swift
//  VDWeather
//
//  Created by Vu Doan on 8/26/19.
//  Copyright © 2019 Tiki.vn. All rights reserved.
//

import Foundation
import UIKit

class VDQueueAlert {
    static let shared = VDQueueAlert()
    let globalQueue = DispatchQueue(label: "com.vd.VDAlertQueue")
    var snackbar: TTGSnackbar! = nil
    
    private func addToQueue(_ message: String) {
        DispatchQueue.main.async {
            self.showError(message)
        }
        sleep(3)
    }
    
    func showMessageError(_ message: String) {
        globalQueue.async {
            self.addToQueue(message)
        }
    }
    
    private func showError(_ message: String) {
        if (snackbar != nil) {
            snackbar.dismiss()
        }
        snackbar = TTGSnackbar(message: message, duration: .forever, actionText: "", actionBlock: { (snackbar) in
            snackbar.dismiss()
        })
        snackbar.duration = .middle
        snackbar.animationType = .slideFromBottomToTop
        snackbar.show()
    }
}
