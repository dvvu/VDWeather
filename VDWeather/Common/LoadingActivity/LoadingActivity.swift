//
//  LoadingActivity.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import UIKit

class LoadingActivity: BaseViewController {
    static var shared: LoadingActivity = LoadingActivity(nibName: "LoadingActivity", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.37)
        LoadingActivity.shared = self
    }
    
    private func show(_ view: UIView? = nil) {
        if let view = view {
            view.addSubview(self.view)
            self.view.frame = view.bounds
        } else {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window {
                window.addSubview(self.view)
                self.view.frame = window.bounds
            }
        }
         UIView.animate(withDuration: 1) {}
    }
    
    private func dismiss() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.view.removeFromSuperview()
        }) { (error) in}
    }

    func showLoading(_ isShow: Bool, view: UIView? = nil) {
        if isShow {
            LoadingActivity.shared.show(view)
        } else {
            LoadingActivity.shared.dismiss()
        }
    }
}
