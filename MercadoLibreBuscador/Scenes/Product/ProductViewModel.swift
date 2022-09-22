//
//  ProductViewController.swift
//  MercadoLibreBuscador
//
//  Created by Francisco Caches Magis on 21/9/22.
//

import Foundation

protocol ProductDelegateProtocol {
    func productLoaded(Item: Item)
    func errorHandler(error: String)
}

public class ProductViewModel {
    
    let productsService = ProductsService()
    var delegate: ProductDelegateProtocol?
    var products: Item?
    
//    init(products: Item) {
//        self.products = products
//    }
    
    func getActivity(limit: Int, product: String, completion: @escaping(Item?) -> Void) {
        productsService.getProducts(15, product) { products in
            self.products = products
            completion(products)
        } onError: { errorData in
            self.delegate?.errorHandler(error: errorData)
        }
    }
}
