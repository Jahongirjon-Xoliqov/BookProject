//
//  YourLibraryCollectionViewCell.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 26/08/23.
//

import UIKit

class YourLibraryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension YourLibraryCollectionViewCell {
    static let id = "YourLibraryCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: "YourLibraryCollectionViewCell", bundle: nil)
    }
}
