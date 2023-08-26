//
//  RecentCollectionViewCell.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 26/08/23.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


extension RecentCollectionViewCell {
    static let id = "RecentCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: "RecentCollectionViewCell", bundle: nil)
    }
}
