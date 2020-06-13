//
//  SearchController.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation
import UIKit

// Delegate we can implement in main controller
protocol SearchController: UISearchBarDelegate {}

extension SearchController where Self: UIViewController {
    
    func configureSearchBar(_ view: UIView) {
        if let navigationController = navigationController {
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.barTintColor = UIColor.blue
            let searchBar = UISearchBar()
            searchBar.placeholder = "home_search".localized
            searchBar.frame = CGRect(x: 0, y: 0, width: navigationController.view.bounds.size.width, height: 64)
            searchBar.isTranslucent = false
            searchBar.barTintColor = .blue
            UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.white
            searchBar.delegate = self
            searchBar.searchTextField.backgroundColor = .white
            searchBar.backgroundImage = UIImage()
            
            view.addSubview(searchBar)
        }
    }
    
    func searchTextValid(_ searchString: String) -> Bool {
        let trimmed = searchString.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.count < 3 ? false : true
    }
    
    func manageCancelButton(_ searchBar: UISearchBar, textDidChange searchText: String)  {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let showCancelButton = trimmed.count < 3 ? false : true
        searchBar.showsCancelButton = showCancelButton
    }
}

