//
//  MoreToExploreView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class MoreToExploreView: UIView {
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var verticalStackView: UIStackView!
    
    private var darkBottomGradientLayer: CAGradientLayer?
    
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
        
        titleLabel.attributedText = NSAttributedString.getMainBoldFont(text: "More to Explore", size: 25, color: .black)
        
        set(model: nil)
    }
    
    func set(model: [MoreToExploreModel?]?) {
        
        guard let model else {
            startLoading()
            return
        }
        
        endLoading()
        
        model.forEach {
            let newGenre = BookGenresBannerView(frame: CGRect(origin: .zero, size: CGSize(width: verticalStackView.frame.width, height: verticalStackView.frame.width/2)))
            newGenre.set($0)
            verticalStackView.addArrangedSubview(newGenre)
            newGenre.heightAnchor.constraint(equalToConstant: verticalStackView.frame.width/2).isActive = true
        }
        
        setNeedsDisplay()
        
    }
    
    
}
