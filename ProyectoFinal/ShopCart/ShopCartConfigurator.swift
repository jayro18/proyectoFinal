//
//  ShopCartConfigurator.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 16/12/22.
//
import UIKit
import Foundation
class ShopCartConfigurator {
    static func make() -> UIViewController {
        let storyboard = UIStoryboard(name: "Products", bundle: nil)
        
        let api = Db_crud()
//
       let presenter = ShopCartPresenter()
       let interactor = ShopCartInteractor()
//        let router = CarRouter(presenter: presenter)
        
        let view = storyboard.instantiateViewController(withIdentifier: "ShopCartViewController") as! ShopCartViewController
        
         interactor.api = api

        presenter.view = view
        presenter.interactor = interactor
//        presenter.router = router
//
//        router.view = view
        
        view.presenter = presenter
        
        return view
    }
}
