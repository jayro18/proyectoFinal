//
//  DataResponse.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//

import Foundation

struct ProductsResponse : Decodable{
        let id: Int
        let title: String
        let price: Double
        let image: String
        let description: String
        let categoria: String
        let stock : Int
    
}
