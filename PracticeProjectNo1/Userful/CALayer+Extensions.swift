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
}
