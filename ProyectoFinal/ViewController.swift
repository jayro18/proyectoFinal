//
//  ViewController.swift
//  ProyectoFinal
//
//  Created by Jayro Adilson Alhuay Galindo on 23/11/22.
//

import UIKit

class ViewController: UIViewController {

    private let onbordingImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "PETiSHOP_LOGO")
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    
    private let textLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Bienvenidos a la App de PetiShop"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var skipOnboardingButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Pulsa para continuar"
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        [onbordingImageView,textLabel,skipOnboardingButton].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            
            onbordingImageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor,constant: -32),
            onbordingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onbordingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onbordingImageView.heightAnchor.constraint(equalToConstant: 150),
            onbordingImageView.widthAnchor.constraint(equalToConstant: 150),
            
            
            textLabel.bottomAnchor.constraint(equalTo: skipOnboardingButton.topAnchor,constant: -42),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            skipOnboardingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skipOnboardingButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
    @objc func showMessage(){
        print("skip onboarding")
    }

}

