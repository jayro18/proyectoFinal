//
//  ShopCartInteractor.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 17/12/22.
//

import Foundation
protocol ShopCartInteractorProtocol {
    func getProductsCar() -> [ShopCartEntityS]
    func deleteProductCar(_ id:Int)
}

class ShopCartInteractor {
    var presenter: ShopCartPresenter?
    var api: Db_crud?
}

extension ShopCartInteractor: ShopCartInteractorProtocol {
    func deleteProductCar(_ id:Int) {
        api?.deleteProduct(id)
    }

    func getProductsCar() -> [ShopCartEntityS] {
        
        return api?.getAllShopCart() ?? []
    }
    
}
