//
//  DetailViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 5/12/22.
//

import UIKit


protocol DetailViewControllerDelegate {
    func detailViewController(_ viewController : DetailViewController , didAddCart newProduct : Product)
}

class DetailViewController: UIViewController {

    var detailProducts : Product?

    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    
    var delegate : DetailViewControllerDelegate?
    
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
 
    @IBAction func addCart(_ sender: UIButton) {
        
//        let vc = CartViewController(nibName: "Products", bundle: nil)
        
        
        guard let vc = (storyboard?.instantiateViewController(withIdentifier: "CartViewController"))! as? CartViewController else { return }
    
      
        
        var addCart = Product(id: detailProducts!.id, title: detailProducts!.title, price: detailProducts!.price, image: detailProducts!.image, description: detailProducts!.description, categoria: detailProducts!.categoria)

       
     
        
        vc.cartArray.append(addCart)
        
//        delegate?.detailViewController(self, didAddCart: addCart)
        
        navigationController?.pushViewController(vc, animated: true)
      

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
