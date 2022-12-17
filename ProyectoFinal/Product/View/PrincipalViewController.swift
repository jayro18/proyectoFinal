//
//  PrincipalViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 30/11/22.
//

import UIKit


class PrincipalViewController: UIViewController {
    
    var presenter: ProductoPresenterOutputProtocol?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.allData()
        collectionView.dataSource = self
        collectionView.delegate=self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
 
      
    }
    

}

extension PrincipalViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.items() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return presenter?.cellProduct(collectionView, indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.viewDetail(indexPath.row)
    }
    
}


extension PrincipalViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 200)
    }
}
