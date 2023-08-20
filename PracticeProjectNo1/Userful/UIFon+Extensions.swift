//
//  UIFon+Extensions.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit


extension UIFont {
    
    static var ATHELAS_BOLD = "Athelas-Bold"
    static var ATHELAS_BOLD_ITALIC = "Athelas-BoldItalic"
    static var ATHELAS_ITALIC = "Athelas-Italic"
    static var ATHELAS_REGULAR = "Athelas-Regular"
    
    static func mainBold(with size: CGFloat = 17) -> UIFont {
        UIFont(name: ATHELAS_BOLD, size: size) ?? defaultBold(with: size)
    }
    static func mainRegular(with size: CGFloat = 17) -> UIFont {
        UIFont(name: ATHELAS_REGULAR, size: size) ?? defaultRegular(with: size)
    }
    static func defaultBold(with size: CGFloat = 17) -> UIFont {
        .boldSystemFont(ofSize: size)
    }
    static func defaultRegular(with size: CGFloat = 17) -> UIFont {
        .systemFont(ofSize: size)
    }
    
}
