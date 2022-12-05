//
//  HomeViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 28/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
   
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var precioLabel: UILabel!
//    @IBOutlet weak var productImageView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.hidesBackButton = true
//        self.navigationItem.backBarButtonItem=nil
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "products", for: indexPath) as? ProductsCollectionViewCell{
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    
}
