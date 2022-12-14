//
//  Networking.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 12/12/22.
//

import Foundation

protocol RemoteRespository {
    func fetchProducts() -> [ProductsResponse]
    func fetchTrendingProducts() -> [ProductsResponse]
}

class ProductsAPI: RemoteRespository {
    func fetchProducts() -> [ProductsResponse] {
        return []
    }
    
    func fetchTrendingProducts() -> [ProductsResponse] {
        return []
    }
}

class ProductsMocksAPI: RemoteRespository {
    func fetchProducts() -> [ProductsResponse] {
        return []
    }
    
    func fetchTrendingProducts() -> [ProductsResponse] {
        
        let resource = "data"
        if let url = Bundle.main.url(forResource: resource, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                
                // API real
                let decoder = JSONDecoder()
                let result = try decoder.decode([ProductsResponse].self, from: data)
                return result
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        
        return []
    }
    
    
}

//protocol ExternalAPI {
//    
//}
//
//class FirebaseAPI : ExternalAPI {
//    
//}
//
//class CompetenciaFirebaseAPI : ExternalAPI {
//    
//}
//
//class MiPropioAPI : ExternalAPI {
//    
//}
//
//protocol DataBase {
//    func getData()
//    func saveData(_ data: String)
//    func updateData(_ value: String)
//    func deleteData(_ value: String)
//}
//
//class UserDefaultDataBase : DataBase {
//    func getData() {
//        
//    }
//    
//    func saveData(_ data: String) {
//        
//    }
//    
//    func updateData(_ value: String) {
//        
//    }
//    
//    func deleteData(_ value: String) {
//        
//    }
//}
//
//class CoreDataDataBase: DataBase {
//    func getData() {
//        
//    }
//    
//    func saveData(_ data: String) {
//        
//    }
//    
//    func updateData(_ value: String) {
//        
//    }
//    
//    func deleteData(_ value: String) {
//        
//    }
//    
//    
//}
