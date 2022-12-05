//
//  Products.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 30/11/22.
//

import UIKit

struct Products{
    let title: String
    let price: String
    let descripcion: String
    let image: UIImage?
    
}

let products: [Products] = [
    Products(title: "Super Can 25kg",price: "S/ 180.00",descripcion: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", image: UIImage(named: "img_1") ),
    Products(title: "Super Can 20kg",price: "S/ 140.00",descripcion: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", image: UIImage(named: "img_1") ),
    Products(title: "Super Can 15kg",price: "S/ 100.00",descripcion: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", image: UIImage(named: "img_1")),
    Products(title: "Super Can 10kg",price: "S/ 70.00",descripcion: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", image: UIImage(named: "img_1")),
    Products(title: "Ricocan 15kg",price: "S/ 100.00",descripcion: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", image: UIImage(named: "img_1")),
    Products(title: "Ricocan 21kg",price: "S/ 140.00",descripcion: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", image: UIImage(named: "img_1")),
    
]
