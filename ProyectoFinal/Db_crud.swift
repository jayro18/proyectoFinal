//
//  db_crud.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 16/12/22.
//

import Foundation
import CoreData
import UIKit


protocol Db_crudProtocol {
      func getAllShopCart() -> [ShopCartEntityS]
      func saveShopCart(_ producto: DetailEntityProtocol, _ amount:Int)
      func setShopCart(producto: DetailEntityProtocol,amount:Int)
}

class Db_crud: Db_crudProtocol {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ShopCartEntity")

    func saveShopCart(_ producto: DetailEntityProtocol, _ amount:Int) {
        let context = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate(format: "(id = %@)", String(producto.id) )
        request.returnsObjectsAsFaults = false
        request.predicate = predicate
        do {
            let results = try context.fetch(request);
            if results.count != 0 {
                let objectUpdate = results[0] as! NSManagedObject
                let count = objectUpdate.value(forKey: "amount") as! Int
                let countTotal = count + amount
                objectUpdate.setValue(countTotal, forKey: "amount")
                objectUpdate.setValue(Double(countTotal) * Double(producto.price), forKey: "price")
                do {
                    try context.save()
                } catch {
                    print("Error al actualizar")
                }
            }else {
                setShopCart(producto: producto, amount: amount)
            }
        } catch {
            print("Error")
        }
    }
    
    func setShopCart(producto: DetailEntityProtocol,amount:Int) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ShopCartEntity", in: context)
        let cart = NSManagedObject(entity: entity!, insertInto: context)
        cart.setValue(producto.id, forKey: "id")
        cart.setValue(amount, forKey: "amount")
        cart.setValue(Double(producto.price) * Double(amount), forKey: "price")
        cart.setValue(producto.descriptionL, forKey: "descriptionL")
        cart.setValue(producto.image, forKey: "image")
        cart.setValue(producto.title, forKey: "title")
        do {
            try context.save()
        } catch {
            print("Error")
        }
    }

    func getAllShopCart() -> [ShopCartEntityS] {
        var products: [ShopCartEntityS] = []
        let context = appDelegate.persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request);
//           print(result as! [NSManagedObject] )
            for data in result as! [NSManagedObject] {
                let id = data.value(forKey: "id") as! Int
                let title = data.value(forKey: "title") as! String
                let amount = data.value(forKey: "amount") as! Int
                let description = data.value(forKey: "descriptionL") as! String
                let imagen = data.value(forKey: "image") as! String
                let price = data.value(forKey: "price")  as! Double
                let product = ShopCartEntityS(id: id, title: title, price: price, description: description, image: imagen, amount: amount)
                products.append(product)
            }
            return products
        } catch {
            print("Error")
        }
        return []
    }
}
