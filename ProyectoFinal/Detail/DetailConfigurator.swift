//
//  File.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation
import UIKit

// Paso 1 (proveedor)
public protocol DetailConfiguratorDelegate {
    func detailConfigurator(didDismiss viewController: UIViewController)
}

public class DetailConfigurator {
    
    /// Paso 2: Crear propiedad (proveedor)
    public var delegate: DetailConfiguratorDelegate?
    
    func make(_ item: ItemDetailProtocol) -> UIViewController {
        
        // Router
        let router = DetailRouter(delegate: delegate!)

        // Presenter
        let presenter = DetailPresenter(itemDetail: item)
        presenter.router = router
        
        // Interactor
        
        
        // View
        
        let storyboard = UIStoryboard(name: "Products", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        view.presenter = presenter
        
        router.view = view
        
        return view
        
    }
    
}
