//
//  LibraryViewController.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Library"
        configureNavItems()
        configureCollectionView()
    }
    
    private func configureNavItems() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        editButton.tintColor = .black
        navigationItem.setRightBarButton(editButton, animated: true)
    }
    
    @objc private func editButtonTapped() {
        
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ActionsCollectionViewCell.nib(), forCellWithReuseIdentifier: ActionsCollectionViewCell.id)
        collectionView.register(LibraryBookCollectionViewCell.nib(), forCellWithReuseIdentifier: LibraryBookCollectionViewCell.id)
        collectionView.contentInset = .init(top: 0, left: 29, bottom: 50, right: 29)
    }
    
}

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let width = collectionView.frame.width-60
            return CGSize(width: width, height: width/2)
        default:
            let width = (collectionView.frame.width-80)/2
            return CGSize(width: width, height: width*4/3+50)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionsCollectionViewCell.id, for: indexPath) as? ActionsCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LibraryBookCollectionViewCell.id, for: indexPath) as? LibraryBookCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        
    }
    
}
