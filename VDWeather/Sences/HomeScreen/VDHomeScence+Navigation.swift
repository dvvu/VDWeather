//
//  VDHomeScence+Navigation.swift
//  VDWeather
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

// Search Bar navigator
extension VDHomeScence: SearchController {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.searchTextField.resignFirstResponder()
        searchBar.showsCancelButton = false
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        manageCancelButton(searchBar, textDidChange: searchText)
        if searchTextValid(searchText) {
            Debounce<String>.input(searchText, comparedAgainst: searchBar.text ?? "") {
                self.viewModel?.fechingData($0)
            }
            searchString = searchText
        }
    }
}

extension VDHomeScence: VDNavigationController {
    @objc func settingClick(sender: UIBarButtonItem) {
        VDRouter.open("/weather/setting", settings: VDRouterItemSetting(.push))
    }
}

