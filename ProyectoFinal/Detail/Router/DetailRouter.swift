//
//  DetailRouter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation
import UIKit


class DetailRouter: DetailRouterProtocol {
    
    var view: UIViewController?
    var delegate: DetailConfiguratorDelegate
    
    required init(delegate: DetailConfiguratorDelegate) {
        self.delegate = delegate
    }
    
    func dismiss() {
        view?.dismiss(animated: true)
        
        /// Paso 3: llamar al método.
        delegate.detailConfigurator(didDismiss: view!)
    }
    
}
