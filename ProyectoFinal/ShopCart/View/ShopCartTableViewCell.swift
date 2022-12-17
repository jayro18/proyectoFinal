//
//  ShopCartTableViewCell.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 17/12/22.
//

import UIKit


class ShopCartTableViewCell: UITableViewCell {

    var presenter: ShopCartPresenterProtocol?
    var idPedido: Int?
    @IBOutlet weak var shopCartImageView: UIImageView!
    
    @IBOutlet weak var titleShopCartLabel: UILabel!
    
    @IBOutlet weak var priceShopCartLabel: UILabel!
    
    @IBAction func deleteShopCart(_ sender: UIButton) {
        print(idPedido ?? 0)
        presenter?.deleteProductCar(idPedido ?? 0)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(_ product:ShopCartEntityS) {
        idPedido = product.id
        DispatchQueue.global().async {
            guard let url = NSURL(string: product.image ) as? URL else {return}
            guard let data = try? Data(contentsOf: url) else {return} //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            
            DispatchQueue.main.async {
                self.shopCartImageView.image = UIImage(data: data)
            }
        }
        priceShopCartLabel.text = String(product.price)
        titleShopCartLabel.text = product.title
//            count.text = "x" + String(product.amount)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


