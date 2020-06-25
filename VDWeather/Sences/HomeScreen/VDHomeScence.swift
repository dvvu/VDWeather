//
//  VDHomeScence.swift
//  VDWeather
//
//  Created by Vu Doan on 6/9/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import UIKit

class VDHomeScence: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var viewModel: HomeViewModel? = {
        return VDContainer.shared.resolve(HomeViewModel.self)
    }()
    
    var searchString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configureNavigationBar()
        configureSearchBar(self.view)
        bindViewModel()
    }
    
    override func retry() {
        if self.searchTextValid(self.searchString) {
            self.viewModel?.fechingData(self.searchString)
        }
    }

    private func configView() {
        title = "home_title".localized
        tableView.addPullToRefresh(direction: .Vertical, action: { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.handlePushToRequest()
        })
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherTableViewCell.self)
    }
    
    private func handlePushToRequest() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.searchTextValid(self.searchString) {
                self.viewModel?.fechingData(self.searchString)
            }
            self.tableView.stopPullToRefresh()
        }
    }
    
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        viewModel.delegate = self
    }
}

// ViewModel Delegate
extension VDHomeScence: HomeViewModelDelegate {
    func failed(_ error: Error) {
        VDQueueAlert.shared.showMessageError(error.localizedDescription.localized)
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func ativityLoading(_ isShow: Bool) {
        LoadingActivity.shared.showLoading(isShow)
    }
}

// New Instance
extension VDHomeScence {
    static func newInstance() -> VDHomeScence {
        let vc = VDHomeScence(nibName: "VDHomeScence", bundle: nil)
        return vc
    }
}

