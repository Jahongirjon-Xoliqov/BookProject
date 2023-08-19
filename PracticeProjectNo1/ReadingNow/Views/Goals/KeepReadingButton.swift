//
//  KeepReadingButton.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

class KeepReadingButton: UIButton {
    
    var titleLbl = UILabel()
    var subTitleLbl = UILabel()
    var imgView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clear()
        configureComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        clear()
        configureComponents()
    }
    
    private func clear() {
//        subviews.forEach {
//            $0.removeFromSuperview()
//        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        clipsToBounds = true
        layer.cornerRadius = rect.height/2
    }
    
    private func configureComponents() {
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 0
        
        verticalStackView.addArrangedSubview(titleLbl)
        verticalStackView.addArrangedSubview(subTitleLbl)
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fill
        horizontalStackView.spacing = 0
        
        horizontalStackView.addArrangedSubview(imgView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        imgView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imgView.isHidden = true
        
        titleLbl.attributedText = NSAttributedString.getSystemFont(text: "Keep Reading", size: 15, color: .white, align: .center)
        subTitleLbl.attributedText = NSAttributedString.getSystemFont(text: "iOS_Architecture_Patterns_MVP_MVVM_VIPER", size: 11, color: .lightText, align: .center)
        
        backgroundColor = UIColor.black
        
    }
    
}
