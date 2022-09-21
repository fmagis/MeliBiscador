//
//  HomeViewController.swift
//  MercadoLibreBuscador
//
//  Created by Francisco Caches Magis on 13/9/22.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var searchbar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "Busca en Mercado libre"
        searchBar.delegate = self
        searchBar.keyboardAppearance = .default
   //     searchBar.searchTextField.backgroundColor = .white
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        searchBarSearchButtonClicked(searchbar)
    }
    
    private func setupNavBar() {
        
        navigationItem.titleView = searchbar
    }
    
}
extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       searchBar.resignFirstResponder()
       guard let titleProduct = searchBar.text else { return }
       print("name product: \(titleProduct)")
     }
    
}
