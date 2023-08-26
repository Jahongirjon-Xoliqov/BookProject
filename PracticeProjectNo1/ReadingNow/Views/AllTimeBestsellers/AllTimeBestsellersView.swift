//
//  AllTimeBestsellersView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class AllTimeBestsellersView: UIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var seeAllLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    private var darkBottomGradientLayer: CAGradientLayer?
    
    var allTimeBestsellersModel: [AllTimeBestsellersModel?]? {
        didSet {
            collectionView.reloadData()
        }
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
        darkBottomGradientLayer?.frame = bounds
    }
    
    func inialisingState() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
    }
    
    func addParent(customView: UIView) {
        customView.frame = bounds
        addSubview(customView)
    }
    
    func configureUI() {
        
        darkBottomGradientLayer = CAGradientLayer()
        darkBottomGradientLayer?.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.1).cgColor]
        darkBottomGradientLayer?.startPoint = CGPoint(x: 0.5, y: 0)
        darkBottomGradientLayer?.endPoint = CGPoint(x: 0.5, y: 1)
        darkBottomGradientLayer?.frame = bounds
        selfView.layer.insertSublayer(darkBottomGradientLayer ?? CALayer(), at: 0)
        
        
        titleLabel.attributedText = NSAttributedString.getMainBoldFont(text: "All-Time Bestsellers", size: 25, color: .black)
        
        seeAllLabel.attributedText = NSAttributedString.getSystemFont(text: "See All", size: 15, color: .black)
        rightImageView.tintColor = .systemGray2
        
        separatorView.backgroundColor = .systemGray4
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(BooksCollectionViewCell.nib(), forCellWithReuseIdentifier: BooksCollectionViewCell.id())
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    
    func set(_ model: [AllTimeBestsellersModel]?) {
        self.allTimeBestsellersModel = model
    }
    
}

extension AllTimeBestsellersView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.height*3/4, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.allTimeBestsellersModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.id(), for: indexPath) as? BooksCollectionViewCell else {
            return UICollectionViewCell()
        }
        let book = self.allTimeBestsellersModel?[indexPath.row]
        cell.set(coverImageUrl: book?.coverImageUrl)
        return cell
        
    }
    
}
