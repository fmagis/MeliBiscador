//
//  CustomNavigationController.swift
//  MercadoLibreBuscador
//
//  Created by Francisco Caches Magis on 13/9/22.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
//        let searchController = UISearchController(searchResultsController: nil)

        
        navigationBar.barTintColor = .black
        navigationBar.tintColor = .black
        navigationBar.backgroundColor = .yellowMeli
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellowMeli
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        
//        searchController.searchBar.placeholder = "Search artists"
//        self.navigationItem.searchController = searchController
//        self.definesPresentationContext = true
    }
    
    
}
