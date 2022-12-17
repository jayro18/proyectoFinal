//
//  CartViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 29/11/22.
//

import UIKit

protocol ShopCartViewControllerProtocol {
    func refresh()
}


class ShopCartViewController: UIViewController, UITableViewDataSource {
   

    @IBOutlet weak var tableView: UITableView!
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    var presenter: ShopCartPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getAllShopCart().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.cellShopCart(tableView, indexPath) ?? UITableViewCell()
    }
    


}

extension ShopCartViewController:ShopCartViewControllerProtocol{
    func refresh() {
        tableView.reloadData()
    }
    
    
}
