//
//  Products.swift
//  MercadoLibreBuscador
//
//  Created by Francisco Caches Magis on 21/9/22.
//

import Foundation

struct Product: Codable {
    
    let id: String
    let site_id: String
    let title: String
    let price: Int?
    let currency_id: String
    let thumbnail: String
    
}

struct ProductsError:Codable{
    
    let error: String
}
