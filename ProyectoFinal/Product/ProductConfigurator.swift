//
//  ProductConfigurator.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//


import UIKit

class ProductConfigurator{
    
    static func makeProducto() -> UIViewController{
       
        let presenter = ProductoPresenter()
        
        let api = ProductsMocksAPI()
        
        let interactor = ProductoInteractor(presenter: presenter, api: api)
       
//        let view = ListaViewController()
        
        let storyboard = UIStoryboard(name: "Products", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PrincipalViewController") as! PrincipalViewController
        
        
        
        let router = ProductoRouter(presenter: presenter)
        router.view = view
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        

        view.presenter = presenter
        
        return view
    }
    
}
