//
//  VDHomeScence.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import UIKit

class VDHomeScence: BaseViewController {
    
    private var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindViewModel()
    }
    
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        viewModel.delegate = self
        viewModel.fechingData()
    }
}

extension VDHomeScence: HomeViewModelDelegate {
    func reload() {
        
    }
}

extension VDHomeScence {
    static func newInstance(viewModel: HomeViewModel) -> VDHomeScence {
        let vc = VDHomeScence(nibName: "VDHomeScence", bundle: nil)
        vc.viewModel = viewModel
        return vc
    }
}
