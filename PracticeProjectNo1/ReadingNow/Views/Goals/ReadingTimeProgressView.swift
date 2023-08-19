//
//  ReadingTimeProgressView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

class ReadingTimeProgressView: UIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var progressView: CircleProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
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
        titleLabel.attributedText = NSAttributedString.getMainBoldFont(text: "Today's Reading", size: 20, color: .black, align: .center)
        timerLabel.attributedText = NSAttributedString.getSystemFont(text: "0:00", size: 80, color: .black, align: .center)
        descLabel.attributedText = NSAttributedString.getSystemFont(text: "of your 5-minute goal", size: 16, color: .black)
        rightImageView.tintColor = UIColor.secondaryLabel
        progressView.backgroundColor = .secondarySystemBackground
        
    }
    
}
