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
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    private func setupNavBar() {
        
        navigationItem.titleView = searchbar
    }
    
}
extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        guard let titleProduct = searchBar.text else { return }
        
        let productViewModel = ProductViewModel()
        print(titleProduct)
        productViewModel.getActivity(limit: 15, product: titleProduct) { products in
            if let products = products {
                
                productViewModel.products = products
                
                let vc = ProductViewController(viewModel: productViewModel)
                vc.modalPresentationStyle = .overFullScreen
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else {
                print("Error")
            }
        }
    }
}
