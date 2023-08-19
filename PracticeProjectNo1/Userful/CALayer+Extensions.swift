//
//  CALayer+Extensions.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

extension CALayer {
    func setBookShadow() {
        shadowColor = UIColor.black.cgColor
        shadowOffset = .zero
        shadowOpacity = 0.2
        shadowRadius = 5
    }
    
    func setBookShadow(offset: CGSize) {
        shadowColor = UIColor.black.cgColor
        shadowOffset = offset
        shadowOpacity = 0.4
        shadowRadius = 10
    }
    
}
