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
    
    func presentDescriptionView(_ product: ProductsResponse){
        let productDetail = DetailEntity(id: product.id, title: product.title, price: product.price, descriptionL: product.description, image: product.image, categoria: product.categoria, stock: product.stock)

        let viewDescription = DetailConfigurator.make(productDetail)
        
        view?.navigationController?.pushViewController(viewDescription, animated: true)
        
        
//        view?.present(viewDescription, animated: true)
    }
    
}


