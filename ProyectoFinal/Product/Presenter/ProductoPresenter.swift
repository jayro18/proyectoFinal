//
//  ProductoPresenter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//


import Foundation

import UIKit
class ProductoPresenter {
    
    var view: ProductoViewProtocol?
    var router: ProductoRouterProtocol?
    var interactor: ProductoInteractorProtocol?
    var productsList:[ProductsResponse] = []
    
}

extension ProductoPresenter: ProductoPresenterOutputProtocol {
    

    func viewDetail(_ index: Int) {
        let product = productsList[index]
        router?.viewDescription(product)
    }
    
    func cellProduct(_ collectionView: UICollectionView, _ indexPath: IndexPath ) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tienda", for: indexPath)
            as? ProductsCollectionViewCell {
            
            cell.layer.cornerRadius = 10
            cell.contentView.layer.cornerRadius = 2.0
            cell.contentView.layer.borderWidth = 2.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
           
            cell.layer.backgroundColor = UIColor.white.cgColor
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
            let product = productsList[indexPath.row]
            cell.setup(with: product)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func allData() {
        productsList = interactor?.productsAPI() ?? []
    }
    
    func items() -> Int{
        return productsList.count
    }
    
}

extension ProductoPresenter: ProductoPresenterInputProtocol {
    func showProductoSelected(_ producto: ProductsResponse) {
        router?.viewDescription(producto)
    }

}
