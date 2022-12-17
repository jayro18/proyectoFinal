//
//  DetailEntity.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation

public protocol DetailEntityProtocol {
    var id: Int { get }
    var title: String { get }
    var price: Double { get }
    var descriptionL: String { get }
    var image: String { get }
    var categoria: String { get }
    var stock: Int { get }
}

class DetailEntity: DetailEntityProtocol {
    let id: Int
    let title: String
    let price: Double
    let descriptionL: String
    let image: String
    let categoria: String
    let stock: Int
    
    required init(id: Int, title: String, price: Double, descriptionL: String, image: String, categoria: String, stock: Int) {
        self.id = id
        self.title = title
        self.price = price
        self.descriptionL = descriptionL
        self.image = image
        self.categoria = categoria
        self.stock = stock
    }
    

    
}
