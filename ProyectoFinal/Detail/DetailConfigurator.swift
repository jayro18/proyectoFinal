//
//  File.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation
import UIKit


class DetailConfigurator {
    
    static func make(_ product: DetailEntityProtocol) -> UIViewController {
        
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        let router = DetailRouter(presenter: presenter)
        
        let storyboard = UIStoryboard(name: "Products", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let api = Db_crud()
        interactor.api = api
        presenter.view = view
         presenter.interactor = interactor
         presenter.router = router
         presenter.producto = product
        
        router.view = view

        view.presenter = presenter
        
        return view
        
    }
    
}
