//
//  ProductoDetail.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation


class ProductoDetail: ItemDetailProtocol {
    
    let id: Int
    let title: String
    let price: Double
    let image: String
    let description: String
    let categoria: String

//    var name: String
    
    required init(id: Int, title: String, price: Double, image: String, description: String, categoria: String) {
        self.id = id
        self.title = title
        self.price = price
        self.image = image
        self.description = description
        self.categoria = categoria
    }

}
