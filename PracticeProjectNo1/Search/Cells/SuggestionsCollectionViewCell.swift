//
//  SuggestionsCollectionViewCell.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 26/08/23.
//

import UIKit

class SuggestionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .red
        contentView.backgroundColor = .red
    }

}

extension SuggestionsCollectionViewCell {
    static let id = "SuggestionsCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: "SuggestionsCollectionViewCell", bundle: nil)
    }
}
