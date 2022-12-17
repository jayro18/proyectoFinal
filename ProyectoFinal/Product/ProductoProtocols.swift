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
    func presentDescriptionView(_ product: ProductsResponse)
}

/// Lista de metodos/propiedad que son usados por el `View`
protocol ProductoPresenterInputProtocol {
    
    
    // Cosas que el view -> presenter
//    func getData()
//    func presentErrorView()
    
    func showProductoSelected(_ producto: ProductsResponse)
}

/// Lista de métodos/propiedades que son usados por los clientes del `presenter`
protocol ProductoPresenterOutputProtocol {
    // Cosas que el router -> presenter
    func viewDetailProduct(_ index: Int)
    func allData()
    func getNumberofItem() -> Int
    func printProductData(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell
    
//    func mostrarProducto(_ producto: [ProductEntity])
}
