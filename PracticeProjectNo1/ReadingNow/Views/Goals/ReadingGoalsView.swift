//
//  ReadingGoalsView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

class ReadingGoalsView: UIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var readinTimeProgressView: ReadingTimeProgressView!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        inialisingState()
        addParent(customView: selfView)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        inialisingState()
        addParent(customView: selfView)
        configureUI()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    func inialisingState() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
    }
    
    func addParent(customView: UIView) {
        customView.frame = bounds
        addSubview(customView)
    }
    
    func configureUI() {
        titleLabel.attributedText = NSAttributedString.getMainBoldFont(text: "Reading Goals", size: 25, color: .black, align: .center)
        descLabel.numberOfLines = 0
        descLabel.attributedText = NSAttributedString.getSystemFont(text: "Read every day, see your stats soar and finish\nmore books.", size: 16, color: .secondaryLabel, align: .center)
        rightImageView.tintColor = .systemGray4
        conditionsLabel.attributedText = NSAttributedString.getSystemFont(text: "Terms and Conditions", size: 12, color: .secondaryLabel)
    }
}
