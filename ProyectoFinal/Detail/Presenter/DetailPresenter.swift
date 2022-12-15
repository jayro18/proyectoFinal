//
//  DetailPresenter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation
class DetailPresenter: DetailPresenterProtocol {
    

    private let itemDetail: ItemDetailProtocol
    
    var router: DetailRouterProtocol?
    
//    var view: DetailViewProtocol?
    
    required init(itemDetail: ItemDetailProtocol) {
        self.itemDetail = itemDetail
    }
    
    func getDetailProduct() -> ItemDetailProtocol{
        return itemDetail
        
//        view?.datoObtenidoDeFormaAsync("")
    }
    func dismiss() {
        router?.dismiss()
    }
    
}
