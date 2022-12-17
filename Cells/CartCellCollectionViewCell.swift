//
//  CartCellCollectionViewCell.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 15/12/22.
//

import UIKit

class CartCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageCartImageView: UIImageView!
    
  
    
    func configure(product: Product){
        productLabel.text = product.title
        priceLabel.text = product.title
//        imageCartImageView.image = product.image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        layer.cornerRadius = 10
//        contentView.layer.cornerRadius = 2.0
//        contentView.layer.borderWidth = 2.0
//        contentView.layer.borderColor = UIColor.clear.cgColor
//        contentView.layer.masksToBounds = true
//        layer.frame = contentView.bounds
//        layer.backgroundColor = UIColor.white.cgColor
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
//        layer.shadowRadius = 2.0
//        layer.shadowOpacity = 1.0
//        layer.masksToBounds = false
//        frame.size =  CGSize(width: 270, height: 200)
//        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:contentView.layer.cornerRadius).cgPath
    }

}
