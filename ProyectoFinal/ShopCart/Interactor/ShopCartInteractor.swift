//
//  ShopCartInteractor.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 17/12/22.
//

import Foundation
protocol ShopCartInteractorProtocol {
    func getShopCart() -> [ShopCartEntityS]
}

class ShopCartInteractor {
    var presenter: ShopCartPresenter?
    var api: Db_crud?
}

extension ShopCartInteractor: ShopCartInteractorProtocol {

    func getShopCart() -> [ShopCartEntityS] {
        
        return api?.getAllShopCart() ?? []
    }
    
}
