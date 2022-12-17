//
//  DetailViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 5/12/22.
//

import UIKit



class DetailViewController: UIViewController {
    // Contador
    var count = 1
    
    var presenter: DetailPresenterProtocol?
    
 
//    var detailProducts : ProductEntity?

    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addCartButton(_ sender: UIButton) {
        
        presenter?.addShopCart(Int(count))

    }
   
    @IBOutlet weak var countLabel: UILabel!
    @IBAction func downButton(_ sender: UIButton) {
        if(count <= 1) {return}
        count = count - 1
        countLabel.text = "\(count)"
    }
    @IBAction func upButton(_ sender: UIButton) {
        
        count = count + 1
        countLabel.text = "\(count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text =  presenter?.getDataProduct().title
        precioLabel.text? =  "S/ \(String(format: "%.2f", (presenter?.getDataProduct().price)!))"
        descriptionLabel.text = presenter?.getDataProduct().descriptionL
        DispatchQueue.global().async {
            guard let url = NSURL(string: self.presenter?.getDataProduct().image ?? "") as? URL else {return}
            guard let data = try? Data(contentsOf: url) else {return} //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            
            DispatchQueue.main.async {
                self.imgImageView.image = UIImage(data: data)
            }
        }
        
        
        
    }
    

}
