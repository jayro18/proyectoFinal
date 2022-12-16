//
//  CartViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 29/11/22.
//

import UIKit

class CartViewController: UIViewController {
   
    var cartArray : [Product] = []
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
        collectionView?.collectionViewLayout = UICollectionViewFlowLayout()
        //collectionView.delegate=self
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        collectionView.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: "CartCollectionViewCell")
        collectionView.register(UINib(nibName: "CartCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CartCellCollectionViewCell")
        
        
    }
    
    
  


}
extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cartArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCellCollectionViewCell", for: indexPath) as? CartCellCollectionViewCell else {
                    return UICollectionViewCell()
               }
        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCollectionViewCell", for: indexPath) as? CartCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
   

        let cart = cartArray[indexPath.row]
        

        cell.configure(product: cart)
//        cell.titleCart.text = cart.title
        
//        cell.setupCart(with: cart)
        return cell
    }
    
    

    
    
}


extension CartViewController {

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nav = segue.destination as? UINavigationController
            guard let id = sender as? NSIndexPath else {return}
            let fila = cartArray[id.row]
            let destino = segue.destination as? DetailViewController
            destino?.detailProducts = fila
            destino?.delegate = self
            
            
        
    }
}



extension CartViewController : DetailViewControllerDelegate{
    func detailViewController(_ viewController: DetailViewController, didAddCart newProduct: Product) {

        cartArray.append(newProduct)
        collectionView.reloadData()
    }
    
    
}


extension CartViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 270, height: 200)
    }
}
