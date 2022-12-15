//
//  DetailViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 5/12/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
 
    var detailProducts : ProductEntity?

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    
    
    // Contador
    
    var count = 1
    
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

        guard let detalle = detailProducts else {return}
        
        DispatchQueue.global().async {
            guard let url = NSURL(string: detalle.image) as? URL else {return}
            guard let data = try? Data(contentsOf: url) else {return} //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            
            DispatchQueue.main.async {
                self.imgImageView.image = UIImage(data: data)
            }
        }
        
        titleLabel.text = detalle.title
       descriptionLabel.text = detalle.description
        precioLabel.text =  "S/ \(String(format: "%.2f", detalle.price))"
        
    }
    
    
    

}
