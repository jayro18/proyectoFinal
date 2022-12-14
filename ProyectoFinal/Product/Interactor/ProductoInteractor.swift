//
//  ProductoInteractor.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//

import Foundation


class ProductoInteractor: ProductoInteractorProtocol {
    var presenter: ProductoPresenterOutputProtocol
    var api: RemoteRespository?
    
    required init(presenter: ProductoPresenterOutputProtocol, api: RemoteRespository) {
        self.presenter = presenter
        self.api = api
    }
    
    func productsAPI() {
        print("called: favoritos en interactor")
        if let products = api?.fetchTrendingProducts() {

            let productoEntity = ProductEntity.make(products)
            presenter.mostrarProducto(productoEntity)
        }
    }
}


