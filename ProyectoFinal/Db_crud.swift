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
      func updateProductCar(_ producto: DetailEntityProtocol, _ amount:Int)
      func saveProductCar(producto: DetailEntityProtocol,amount:Int)
//    func deleteProduct(_ id:Int)
}

class Db_crud: Db_crudProtocol {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ShopCartEntity")
//        let request = NSFetchRequest<ShopCartEntity> = ShopCartEntity.fetchRequest()

    func deleteProduct(_ id: Int) {
        let context = appDelegate.persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        let predicate = NSPredicate(format: "(id = %@)", String(id) )
        request.predicate = predicate
        do {
            let result = try context.fetch(request);
            let data = result[0] as! NSManagedObject
            context.delete(data)
            print(data)
        } catch {
            print("Failed")
        }
    }


    func updateProductCar(_ producto: DetailEntityProtocol, _ amount:Int) {
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
                    print("update")
                } catch let error as NSError {
                    print(error)
                }
            }else {
                saveProductCar(producto: producto, amount: amount)
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func saveProductCar(producto: DetailEntityProtocol,amount:Int) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ShopCartEntity", in: context)
        let newProductCar = NSManagedObject(entity: entity!, insertInto: context)
        newProductCar.setValue(producto.id, forKey: "id")
        newProductCar.setValue(amount, forKey: "amount")
        newProductCar.setValue(Double(producto.price) * Double(amount), forKey: "price")
        newProductCar.setValue(producto.descriptionL, forKey: "descriptionL")
        newProductCar.setValue(producto.image, forKey: "image")
        newProductCar.setValue(producto.title, forKey: "title")
        do {
            try context.save()
            //counter.value = 1
            //Cantidad.text = "1"
        } catch {
            print("Error saving")
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
                //PriceT += price // usar viper
                let product = ShopCartEntityS(id: id, title: title, price: price, description: description, image: imagen, amount: amount)
                products.append(product)
            }
            return products
        } catch {
            print("Failed")
        }
        return []
    }
}
