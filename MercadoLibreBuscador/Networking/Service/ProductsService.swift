//
//  ActivitiesService.swift
//  MercadoLibreBuscador
//
//  Created by Francisco Caches Magis on 21/9/22.
//

import Foundation
import Alamofire

struct ProductsService {
    
    typealias ProductsCompletion = (_ products: Item) -> Void
    typealias ErrorHandler = (_ errorData: String) -> Void

    public func getProducts(_ limit: Int,_ product: String, onSuccess: @escaping ProductsCompletion, onError: @escaping ErrorHandler){
        
        var url = "https://api.mercadolibre.com/sites/MLU/search?q="
        url.append(product)

        let limitProduct = "&limit=\(limit)"
        url.append(contentsOf: limitProduct)
        
        
        let requestApi = AF.request(url, encoding: URLEncoding.default)
        requestApi.responseDecodable(of: Item.self, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let dataResponse):
                onSuccess(dataResponse)
            case .failure(let errorData):
                print(errorData)
                onError(errorData.errorDescription ?? "Error")
            }
        }
    }
}

