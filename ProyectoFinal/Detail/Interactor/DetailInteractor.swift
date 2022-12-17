//
//  DetailInteractor.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation

protocol DetailInteractorProtocol {
    func setProductDatacore(_ producto: DetailEntityProtocol, _ amount:Int)
}

class DetailInteractor: DetailInteractorProtocol {
    var api: Db_crudProtocol?
    var presenter: DetailPresenterProtocol?
    
    
    func setProductDatacore(_ producto: DetailEntityProtocol, _ amount:Int) {
        api?.updateProductCar(producto, amount)
    }
}


