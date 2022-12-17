//
//  DetailRouter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation
import UIKit

protocol DetailRouterProtocol {
    func presentShopCartView()
}

class DetailRouter: DetailRouterProtocol {
  
    var presenter : DetailPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func presentShopCartView() {
        let viewCar = ShopCartConfigurator.make()
        view?.navigationController?.pushViewController(viewCar, animated: true)
//        viewCar.modalPresentationStyle = .fullScreen
//        view?.present(viewCar, animated: true)
    }
    
    
    
}
