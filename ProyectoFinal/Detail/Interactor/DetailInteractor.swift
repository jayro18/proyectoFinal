//
//  DetailInteractor.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation

protocol DetailInteractorProtocol {
    func sendDataCore(_ producto: DetailEntityProtocol, _ amount:Int)
}

class DetailInteractor: DetailInteractorProtocol {
    var api: Db_crudProtocol?
    var presenter: DetailPresenterProtocol?
    
    
    func sendDataCore(_ producto: DetailEntityProtocol, _ amount:Int) {
        api?.saveShopCart(producto, amount)
    }
}


