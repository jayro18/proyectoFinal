//
//  ProductoPresenter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//


import Foundation

//protocol ListaPresenterProtocol {
//
////    // Cosas que el view -> presenter
////    func getData()
////    func presentErrorView()
////
////    // Cosas que el router -> presenter
////    func opcionSeleccionada(_ index: Int)
////    func mostrarPet(_ pet: [PetEntity])
//
//}

import UIKit
class ProductoPresenter {
    
    var view: ProductoViewProtocol?
    var router: ProductoRouterProtocol?
    var interactor: ProductoInteractorProtocol?

    //    var productsList:[ProductEntity] = [ProductEntity]()
    var productsList:[ProductsResponse] = []
    
}

extension ProductoPresenter: ProductoPresenterOutputProtocol {

    func allData() {
        productsList = interactor?.productsAPI() ?? []
    }
    
    func getNumberofItem() -> Int{
        return productsList.count
    }
    
    func viewDetailProduct(_ index: Int) {
        let product = productsList[index]
        router?.presentDescriptionView(product)
    }
    
    func printProductData(_ collectionView: UICollectionView, _ indexPath: IndexPath ) -> UICollectionViewCell {
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
}

extension ProductoPresenter: ProductoPresenterInputProtocol {
    func showProductoSelected(_ producto: ProductsResponse) {
        router?.presentDescriptionView(producto)
    }

}
