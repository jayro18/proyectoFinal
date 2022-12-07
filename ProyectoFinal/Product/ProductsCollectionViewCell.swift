//
//  ProductsCollectionViewCell.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 30/11/22.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tiendaImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    func setup(with products: Products){
        
        DispatchQueue.global().async {
            guard let url = NSURL(string: products.image) as? URL else {return}
            let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.tiendaImageView.image = UIImage(data: data!)
            }
        }
        

        priceLabel.text = products.price
        titleLabel.text = products.title
    }
}
