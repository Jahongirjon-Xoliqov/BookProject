//
//  CALayer+Extensions.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

extension CALayer {
    
    func setBookShadow(offset: CGSize = .zero) {
        shadow(offset: offset, color: .black, radius: 10, opacity: 0.4)
    }
    
    func shadow(path: UIBezierPath? = nil,
                offset: CGSize,
                color: UIColor,
                radius: CGFloat,
                opacity: Float) {
        
        shadowOffset = offset
        shadowColor = color.cgColor
        shadowRadius = radius
        shadowOpacity = opacity
        
        if let path = path?.cgPath {
            shadowPath = path
        }
        
    }
    
}
