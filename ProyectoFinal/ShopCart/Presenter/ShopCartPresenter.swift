//
//  ShopCartPresenter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 17/12/22.
//

import Foundation
import UIKit

protocol ShopCartPresenterProtocol {
    func getAllShopCart() -> [ShopCartEntityS]
    func cellShopCart(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell
    
    

}

class ShopCartPresenter {
//    var router: CarRouterProtocol?
      var interactor: ShopCartInteractorProtocol?
      var view: ShopCartViewControllerProtocol?
    
   var products: [ShopCartEntityS] = []
    
  
    var priceTotal: Int = 0
    
}

extension ShopCartPresenter: ShopCartPresenterProtocol {

    func cellShopCart(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCartCell", for: indexPath) as? ShopCartTableViewCell else { return UITableViewCell() }
               
                let product = products[indexPath.row]
                cell.setup(product)
                return cell
            
    }
    
    
    func getAllShopCart() -> [ShopCartEntityS] {
        if products.isEmpty {
            products = interactor?.getShopCart() ?? []
        }
        return products
    }
    
    
}
