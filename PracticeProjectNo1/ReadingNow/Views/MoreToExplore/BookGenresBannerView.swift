//
//  BookGenresBannerView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class BookGenresBannerView: UIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstBookImageView: UIImageView!
    @IBOutlet weak var secondBookImageView: UIImageView!
    @IBOutlet weak var thirdBookImageView: UIImageView!
    
    var genre: MoreToExploreModel?
    
    convenience init() {
        self.init(frame: .zero)
        inialisingState()
        addParent(customView: selfView)
        configureUI()
    }
    
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
        clipsToBounds = false
        layer.shadowOffset = CGSize(width: -5, height: 5)
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        
        selfView.clipsToBounds = true
        selfView.layer.cornerRadius = 8
        
        firstBookImageView.image = UIImage(named: "swiftexpert")
        secondBookImageView.image = UIImage(named: "swiftexpert")
        thirdBookImageView.image = UIImage(named: "swiftexpert")
        
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = NSAttributedString.getMainBoldFont(text: "Fiction &\nLiterature", size: 18, color: .black)
    }
    
    func set(_ genre: MoreToExploreModel?) {
        
        guard let genre else {
            return
        }
        
        self.genre = genre
        
        titleLabel.attributedText = NSAttributedString.getMainBoldFont(text: genre.title, size: 18, color: .black)
        
        firstBookImageView.downloadImage(from: genre.firstBookCoverUrl)
        secondBookImageView.downloadImage(from: genre.secondBookCoverUrl)
        thirdBookImageView.downloadImage(from: genre.thirdBookCoverUrl)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        selfView.backgroundColor = .systemGray5
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        selfView.backgroundColor = .systemBackground
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        selfView.backgroundColor = .systemBackground
    }
    
}
