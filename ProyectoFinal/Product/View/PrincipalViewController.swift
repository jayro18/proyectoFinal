//
//  PrincipalViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 30/11/22.
//

import UIKit


class PrincipalViewController: UIViewController {
    
    var presenter: ProductoPresenterInputProtocol?
    
    var productsList:[ProductEntity] = [ProductEntity]()


    // Agregar una variable lazy para que este filtro funcione cuando ya este lleno el productsList
   lazy var foodCategory = productsList.filter{$0.categoria == "comida"}
   lazy var accessoryCategory = productsList.filter{$0.categoria == "accesorio"}
    lazy var aseoCategory = productsList.filter{$0.categoria == "aseo"}
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
 
//    Categoria
    @IBAction func categorySegmentedControl(_ sender: UISegmentedControl) {
        collectionView.reloadData()
       

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("called view")
        presenter?.getData()
        presenter?.presentErrorView()
//        fetchData()
        collectionView.dataSource = self
        collectionView.delegate=self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
 
      
    }
    

}

extension PrincipalViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return foodCategory.count
        case 1:
            return accessoryCategory.count
        case 2:
            return aseoCategory.count
        default:
            break
        }
        return 0
//        return productsList.count
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
            
        switch segmentedControl.selectedSegmentIndex {
        case 0:

            cell.setup(with: foodCategory[indexPath.row])
            return cell
        case 1:
            cell.setup(with: accessoryCategory[indexPath.row])
            return cell
        case 2:
            cell.setup(with: aseoCategory[indexPath.row])
            return cell
        default:
            break
        }
//           cell.setup(with: productsList[indexPath.row])
        
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
            
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                let fila = foodCategory[id.row]
                let destino = segue.destination as? DetailViewController

                destino?.detailProducts = fila

            case 1:
                let fila = accessoryCategory[id.row]
                let destino = segue.destination as? DetailViewController

                destino?.detailProducts = fila

            case 2:
                let fila = aseoCategory[id.row]
                let destino = segue.destination as? DetailViewController

                destino?.detailProducts = fila

            default:
                break
            }
            
//            let fila = productsList[id.row]
//            let destino = segue.destination as? DetailViewController
//
//            destino?.detailProducts = fila
            
        }
    }
    
//    func fetchData() {
//        guard let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") else
//        {
//            print("File location")
//            return
//
//        }
//
//        do {
//           let data = try Data(contentsOf: fileLocation)
//            let receivedData = try JSONDecoder().decode([Products].self, from: data)
//
//            self.productsList = receivedData
//
//
//        } catch  {
//            print("Error decoding in decoding \(error)")
//        }
//    }
    
}


extension PrincipalViewController: ProductoViewProtocol{

    func showProductos(_ products: [ProductEntity]) {
        self.productsList = products
        collectionView.reloadData()
    }
    
    func mostrar(_ numero: Int) {
        /// mostrar el numero recibido
        print("called: mostrar numero en view")
    }
    
    
}


extension PrincipalViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 200)
    }
}
