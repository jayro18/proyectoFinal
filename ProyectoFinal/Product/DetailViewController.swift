//
//  DetailViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 5/12/22.
//

import UIKit

class DetailViewController: UIViewController {

    var detailProducts : Products?
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = detailProducts?.title
        descriptionLabel.text = detailProducts?.descripcion
        precioLabel.text = detailProducts?.price
        
    }
    


}
