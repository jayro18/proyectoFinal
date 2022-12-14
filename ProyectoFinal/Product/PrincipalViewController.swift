//
//  PrincipalViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 30/11/22.
//

import UIKit

class PrincipalViewController: UIViewController {
    
    var productsList:[Products] = [Products]()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

              
        
        collectionView.dataSource = self
        collectionView.delegate=self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        fetchData()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PrincipalViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tienda", for: indexPath) as! ProductsCollectionViewCell

            cell.layer.cornerRadius = 10
            cell.contentView.layer.cornerRadius = 2.0
            cell.contentView.layer.borderWidth = 2.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true

            cell.layer.backgroundColor = UIColor.white.cgColor
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
            cell.setup(with: productsList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //En un didSelectItemAt de un collection se le pasa el indexPath al sender
        //En el tableView es el self
        performSegue(withIdentifier: "detalle", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalle"{
         //   guard let name = nameTF, !name.isEmpty else { return  }
            
            guard let id = sender as? NSIndexPath else {return}
            let fila = productsList[id.row]
            let destino = segue.destination as? DetailViewController
            
            destino?.detailProducts = fila
            
        }
    }
    
    func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") else
        {
            print("File location")
            return
            
        }
    
        do {
           let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([Products].self, from: data)
            
            self.productsList = receivedData
            
        
        } catch  {
            print("Error decoding in decoding \(error)")
        }
    }
    
}





extension PrincipalViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 200)
    }
}


