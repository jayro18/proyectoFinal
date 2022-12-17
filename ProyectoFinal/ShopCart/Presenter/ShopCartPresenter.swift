//
//  ShopCartPresenter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 17/12/22.
//

import Foundation
import UIKit

protocol ShopCartPresenterProtocol {
    func getProducts() -> [ShopCartEntityS]
    func printTable(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell
    
//    func getPriceTotal() -> String
    
    func deleteProductCar(_ id: Int)
}

class ShopCartPresenter {
//    var router: CarRouterProtocol?
      var interactor: ShopCartInteractorProtocol?
      var view: ShopCartViewControllerProtocol?
    
   var products: [ShopCartEntityS] = []
    
  
    var priceTotal: Int = 0
    
}

extension ShopCartPresenter: ShopCartPresenterProtocol {
    func deleteProductCar(_ id: Int) {
        print("--------------->delete"+String(id))
        interactor?.deleteProductCar(id)
        products = products.filter{ p in
            p.id != id
        }
        view?.reloadTable()

    }
    
    func printTable(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCartCell", for: indexPath) as? ShopCartTableViewCell else { return UITableViewCell() }
               
                let product = products[indexPath.row]
                cell.setup(product)
//                cell.presenter = self
                return cell
            
    }
    
//    func getPriceTotal() -> String {
//        priceTotal = 0
//        products.forEach { p in
//            priceTotal += p.priceProduct
//        }
//        print(priceTotal)
//        return String(priceTotal)
//    }
    
    func getProducts() -> [ShopCartEntityS] {
        if products.isEmpty {
            products = interactor?.getProductsCar() ?? []
        }
//        view?.reloadPrice()
        return products
    }
    
    
}
