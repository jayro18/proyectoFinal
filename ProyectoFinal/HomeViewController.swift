//
//  HomeViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 28/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func nextView(_ sender: UIButton) {
        
        let productViewController = ProductConfigurator.makeProducto()
        navigationController?.pushViewController(productViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
    
