//
//  MainNavigationController.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        //you can configure any style here
        navigationBar.prefersLargeTitles = true
        navigationBar.layoutMargins.left = 30
        navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Athelas-Bold", size: 40)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
    
    @objc private func userIconTapped() {
        print("taaaap")
    }
    
    static func attach(_ controller: UIViewController?) -> MainNavigationController {
        MainNavigationController(rootViewController: controller ?? UIViewController())
    }
    
    func addProfileIcon() {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        navigationBar.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -7).isActive = true
        imageView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -10).isActive = true
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userIconTapped)))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 17.5
    }
    
    
}
