//
//  VDHomeScence+TableView.swift
//  VDWeather
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

// TableView DataSource, Delegate

extension VDHomeScence: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.results?.days?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherTableViewCell = tableView.dequeueReusableCell(ofType: WeatherTableViewCell.self)
        cell.configUI(viewModel?.results?.days?[indexPath.row])
        return cell
    }
}
