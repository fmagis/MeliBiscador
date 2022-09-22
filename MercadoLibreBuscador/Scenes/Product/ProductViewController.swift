//
//  ProductViewController.swift
//  MercadoLibreBuscador
//
//  Created by Francisco Caches Magis on 21/9/22.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDelegate {
    
    let viewModel: ProductViewModel
    
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ProductViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchbar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "Busca en Mercado libre"
        searchBar.delegate = self
        searchBar.keyboardAppearance = .default
        return searchBar
    }()

    @IBOutlet weak var ProductsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        ProductsTable.dataSource = self
        ProductsTable.delegate = self
        ProductsTable.register(UINib(nibName: "CustomCellTableViewCell", bundle: .main), forCellReuseIdentifier: "CustomCellTableViewCell")
        
        reLoad()
                               
    }
    
    private func reLoad(){
        ProductsTable.reloadData()
    }
    private func setupNavBar() {
        
        navigationItem.titleView = searchbar
    }
}

extension ProductViewController: UISearchBarDelegate {}

extension ProductViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellTableViewCell", for: indexPath)
                  as? CustomCellTableViewCell else {
            return CustomCellTableViewCell()
        }
        
        guard let product: Product = viewModel.products?.results[indexPath.row] else { return CustomCellTableViewCell()}
        
        cell.set(product: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products?.results.count ?? 0
    }
    
   
}
