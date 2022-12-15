//
//  DetailProtocol.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 14/12/22.
//

import Foundation

public protocol ItemDetailProtocol {
    var id: Int { get }
    var title: String { get }
    var price: Double { get }
    var image: String { get }
    var description: String { get }
    var categoria: String { get }

    
//    var name: String { get }

}

protocol DetailPresenterProtocol {
    func getDetailProduct() -> ItemDetailProtocol
    func dismiss()
}

protocol DetailRouterProtocol {
    func dismiss()
}
