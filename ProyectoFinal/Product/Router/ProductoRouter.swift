//
//  ProductoRouter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//

import UIKit

class ProductoRouter: ProductoRouterProtocol {

    
    
//    var detailConfigurator: DetailConfigurator?

    func presetProductoDetail(_ producto: ProductEntity) {

//        let petDetail = PetDetail(name: pet.name)
//
//        detailConfigurator = DetailConfigurator()
//
//        /// Paso 3 (cliente)
//        detailConfigurator?.delegate = self
//        let detailViewController = detailConfigurator!.make(petDetail)
//        view?.present(detailViewController, animated: true)

    }
    
    func mostrar(_ producto: ProductEntity) {
  
        let viewController = UIViewController()
        
        let storyboard = UIStoryboard(name: "Products", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PrincipalViewController") as! PrincipalViewController
        navigationController?.pushViewController(viewController, animated: true)
//        view?.present(viewController, animated: true)
    }
    
    
    let presenter: ProductoPresenterOutputProtocol?
    var view: UIViewController?
    
    required init(presenter: ProductoPresenterOutputProtocol) {
        self.presenter = presenter
    }
    
    func presentaAlerta() {
        /// alerta presentada
        ///
        /// Usuario seleccionó opción 3
        print("called: presetAlerta en router")
        presenter?.opcionSeleccionada(3)

        
//        view?.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>)
//        view?.show(<#T##vc: UIViewController##UIViewController#>, sender: <#T##Any?#>)
//        view?.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
}

/// Paso 1 (cliente)
//extension ListaRouter: DetailConfiguratorDelegate {
//
//    /// Paso 2 (cliente)
//    func detailConfigurator(didDismiss viewController: UIViewController) {
//        print("soy notificado")
//    }
//
//}
