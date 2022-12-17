//
//  ProductoProtocols.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//

import Foundation
import UIKit

protocol ProductoViewProtocol {
    func mostrar(_ numero: Int)
    func showProductos(_ productos: [ProductEntity])
}

protocol ProductoInteractorProtocol {
    func productsAPI() -> [ProductsResponse]
}

protocol ProductoRouterProtocol {
    func viewDescription(_ product: ProductsResponse)
}

/// Lista de metodos/propiedad que son usados por el `View`
protocol ProductoPresenterInputProtocol {
    
    func showProductoSelected(_ producto: ProductsResponse)
}

/// Lista de métodos/propiedades que son usados por los clientes del `presenter`
protocol ProductoPresenterOutputProtocol {
    // Cosas que el router -> presenter
    func viewDetail(_ index: Int)
    func allData()
    func items() -> Int
    func cellProduct(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell
}
