//
//  DetailPresenter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation
import UIKit
import CoreData

protocol DetailPresenterProtocol {
    func addShopCart(_ amount:Int)
    func getDataProduct() -> DetailEntityProtocol
}

class DetailPresenter {
    var view: UIViewController!
    var router: DetailRouterProtocol?
    var interactor: DetailInteractorProtocol?
    var producto: DetailEntityProtocol?

}


extension DetailPresenter: DetailPresenterProtocol {
    
    
    func getDataProduct() -> DetailEntityProtocol {
        return producto!
//        return producto ?? DetailEntity(id: 0, title: "", price: 0, descriptionL: "", image: "", categoria: "", stock: 0)
    }
    
    func addShopCart(_ amount:Int) {
        interactor?.setProductDatacore(producto!, amount)
        router?.presentShopCartView()
    }
}
    
