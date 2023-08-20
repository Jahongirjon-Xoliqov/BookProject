//
//  ActionsCollectionViewCell.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

class ActionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionsImageView: UIImageView!
    @IBOutlet weak var collectionsLabel: UILabel!
    @IBOutlet weak var collectionsRightImageView: UIImageView!
    @IBOutlet weak var pdfCountLabel: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var sortOptionView: UIView!
    @IBOutlet weak var sortOptionLabel: UILabel!
    @IBOutlet weak var sortOptionArrowView: UIImageView!
    @IBOutlet weak var sortClickableImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .systemGray5
        
        collectionsImageView.tintColor = UIColor.secondaryLabel
        collectionsLabel.attributedText = NSAttributedString.getSystemFont(text: "Collections", size: 16, color: .black)
        pdfCountLabel.attributedText = NSAttributedString.getSystemFont(text: "5 PDFs", size: 16, color: .secondaryLabel)
        sortLabel.attributedText = NSAttributedString.getSystemFont(text: "SORT", size: 13, color: .secondaryLabel)
        sortOptionLabel.attributedText = NSAttributedString.getSystemFont(text: "MANNUAL", size: 13, color: .black)
        sortOptionArrowView.tintColor = .black
        sortClickableImageView.tintColor = .black
        collectionsRightImageView.tintColor = .secondaryLabel
        
    }

}

extension ActionsCollectionViewCell {
    static var id = "ActionsCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: id, bundle: nil)
    }
}
