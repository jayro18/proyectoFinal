//
//  ProductoProtocols.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//

import Foundation

protocol ProductoViewProtocol {
    func mostrar(_ numero: Int)
    func showProductos(_ productos: [ProductEntity])
}

protocol ProductoInteractorProtocol {
    func productsAPI()
}

protocol ProductoRouterProtocol {
    func presentaAlerta()
    func mostrar(_ producto: ProductEntity)
    func presetProductoDetail(_ producto: ProductEntity)
}

/// Lista de metodos/propiedad que son usados por el `View`
protocol ProductoPresenterInputProtocol {
    
    // Cosas que el view -> presenter
    func getData()
    func presentErrorView()
    
    func showProductoSelected(_ producto: ProductEntity)
}

/// Lista de métodos/propiedades que son usados por los clientes del `presenter`
protocol ProductoPresenterOutputProtocol {
    // Cosas que el router -> presenter
    func opcionSeleccionada(_ index: Int)
    func mostrarProducto(_ producto: [ProductEntity])
}
