//
//  LibraryBookCollectionViewCell.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

class LibraryBookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var cloudImageView: UIImageView!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var completionProcentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = false
        contentView.clipsToBounds = false
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        coverImageView.clipsToBounds = false
        coverImageView.layer.setBookShadow()
        completionProcentLabel.attributedText = NSAttributedString.getSystemFont(text: "3%", size: 14, color: .secondaryLabel)
        cloudImageView.tintColor = .secondaryLabel
        detailsImageView.tintColor = .secondaryLabel
    }

}

extension LibraryBookCollectionViewCell {
    static var id = "LibraryBookCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: id, bundle: nil)
    }
}
