//
//  CustomCellTableViewCell.swift
//  MercadoLibreBuscador
//
//  Created by Francisco Caches Magis on 21/9/22.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageProduct: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var Info: UILabel!
    
    
    func set(product: Product) {
        titleLabel.text = product.title
        ImageProduct.load(url: URL(string: product.thumbnail)!)
        Price.text = "\(product.currency_id) \(product.price!)"
        
    }
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
