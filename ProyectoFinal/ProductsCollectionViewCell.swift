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
        tiendaImageView.image = products.image
        priceLabel.text = products.price
        titleLabel.text = products.title
    }
}
