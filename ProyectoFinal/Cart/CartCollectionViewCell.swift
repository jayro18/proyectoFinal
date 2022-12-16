//
//  CartCollectionViewCell.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageCart: UIImageView!
    @IBOutlet weak var titleCart: UILabel!
    @IBOutlet weak var priceCart: UILabel!
    
    
    func setupCart(with products: Product){
        
//        DispatchQueue.global().async {
//            guard let url = NSURL(string: products.image) as? URL else {return}
//            guard let data = try? Data(contentsOf: url) else {return} //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//
//            DispatchQueue.main.async {
//                self.imageCart?.image = UIImage(data: data)
//            }
//        }
        

//        layer.backgroundColor = CGColor.init(red: 255, green: 0, blue: 0, alpha: 1)
        priceCart.text = "S/ \(String(format: "%.2f", products.price))"
        titleCart.text = products.title
    }
}
