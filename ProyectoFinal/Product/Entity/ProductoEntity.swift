//
//  ProductoEntity.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//

import Foundation

import UIKit


struct ProductEntity {
        let id: Int
        let title: String
        let price: Double
        let image: String
        let description: String
        let categoria: String
 
    
    static func make(_ productos: [ProductsResponse]) -> [ProductEntity] {
        return productos.map({ ProductEntity(id: $0.id, title: $0.title, price:$0.price , image: $0.image, description: $0.description, categoria: $0.categoria ) })
    }
}
