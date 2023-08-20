//
//  NSAttributedString+Extensions.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

extension NSAttributedString {
    
    static func getMainFont(text: String, size: CGFloat, color: UIColor) -> NSAttributedString {
        create(text: text, font: .mainRegular(with: size), color: color, align: .left, letterSpace: 0, lineSpace: 0)
    }
    
    static func getMainBoldFont(text: String,
                                size: CGFloat,
                                color: UIColor,
                                align: NSTextAlignment = .left) -> NSAttributedString {
        
        create(text: text, font: .mainBold(with: size), color: color, align: align, letterSpace: 0, lineSpace: 0)
    }
    
    
    static func getSystemFont(text: String,
                              size: CGFloat,
                              color: UIColor,
                              align: NSTextAlignment = .left) -> NSAttributedString {
        create(text: text, font: .defaultRegular(with: size), color: color, align: align, letterSpace: 0, lineSpace: 0)
        
    }
    
    static func create(text: String,
                       font: UIFont,
                       color: UIColor,
                       align: NSTextAlignment,
                       letterSpace: CGFloat,
                       lineSpace: CGFloat) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = align
        paragraphStyle.lineSpacing = lineSpace
        
        var attrs: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        var mutableAttrs = NSMutableAttributedString(string: text, attributes: attrs)
        mutableAttrs.addAttribute(NSAttributedString.Key.kern, value: letterSpace, range: NSRange(location: 0, length: mutableAttrs.length - 1))
        
        return mutableAttrs
        
    }
}
