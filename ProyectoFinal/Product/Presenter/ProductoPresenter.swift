//
//  ProductoPresenter.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//


import Foundation

//protocol ListaPresenterProtocol {
//
////    // Cosas que el view -> presenter
////    func getData()
////    func presentErrorView()
////
////    // Cosas que el router -> presenter
////    func opcionSeleccionada(_ index: Int)
////    func mostrarPet(_ pet: [PetEntity])
//
//}


class ProductoPresenter {
    
    var view: ProductoViewProtocol?
    var router: ProductoRouterProtocol?
    var interactor: ProductoInteractorProtocol?

}

extension ProductoPresenter: ProductoPresenterOutputProtocol {
    
    func mostrarProducto(_ productos: [ProductEntity]) {
//        router?.mostrar(pet)
        view?.showProductos(productos)
    }

    func opcionSeleccionada(_ index: Int) {
        interactor?.productsAPI()
    }
}

extension ProductoPresenter: ProductoPresenterInputProtocol {
    
    func showProductoSelected(_ producto: ProductEntity) {
        router?.presetProductoDetail(producto)
    }

    func getData() {
        /// se hizo muchas cosas
        ///
        print("called: getData() presenter")
        view?.mostrar(4)
        
    }
    func presentErrorView() {
        print("called: presentErrorView presenter")
        router?.presentaAlerta()
    }
}
