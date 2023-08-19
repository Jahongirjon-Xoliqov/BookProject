//
//  BooksCollectionViewCell.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = false
        contentView.clipsToBounds = false
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.layer.setBookShadow(offset: CGSize(width: 0, height: 10))
        
    }

}

extension BooksCollectionViewCell {
    static func id() -> String {
        return "BooksCollectionViewCell"
    }
    
    static func nib() -> UINib {
        UINib(nibName: id(), bundle: nil)
    }
}
