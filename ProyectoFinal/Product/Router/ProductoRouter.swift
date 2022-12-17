//
//  ProductoRouter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//

import UIKit

class ProductoRouter: ProductoRouterProtocol {
    
    
    let presenter: ProductoPresenterOutputProtocol?
    var view: UIViewController?
    
    required init(presenter: ProductoPresenterOutputProtocol) {
        self.presenter = presenter
    }
    
    func viewDescription(_ product: ProductsResponse){
        let detail = DetailEntity(id: product.id, title: product.title, price: product.price, descriptionL: product.description, image: product.image, categoria: product.categoria, stock: product.stock)

        let VDescription = DetailConfigurator.make(detail)
        
        view?.navigationController?.pushViewController(VDescription, animated: true)
    }
    
}


