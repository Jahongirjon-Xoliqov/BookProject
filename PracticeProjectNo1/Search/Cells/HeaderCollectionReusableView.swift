//
//  HeaderCollectionReusableView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 26/08/23.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    func setTitle(_ text: String) {
        
        titleLabel.removeFromSuperview()
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30).isActive = true
        
        titleLabel.attributedText = NSAttributedString.getMainBoldFont(text: text,
                                                                       size: 25,
                                                                       color: .black)
        
        separatorView.removeFromSuperview()
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30).isActive = true
        
    }
    
}

extension HeaderCollectionReusableView {
    static let id = "HeaderCollectionReusableView"
}
