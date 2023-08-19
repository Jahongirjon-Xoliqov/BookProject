//
//  NSAttributedString+Extensions.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

extension NSAttributedString {
    static func getMainFont(text: String, size: CGFloat, color: UIColor) -> NSAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: "Athelas-Regular", size: size) ?? .systemFont(ofSize: size),
            NSAttributedString.Key.foregroundColor: color
        ]
        return NSAttributedString(string: text, attributes: attrs)
    }
    
    static func getMainBoldFont(text: String,
                                size: CGFloat,
                                color: UIColor,
                                align: NSTextAlignment = .left) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = align
        
        let attrs: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: "Athelas-Bold", size: size) ?? .systemFont(ofSize: size),
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        return NSAttributedString(string: text, attributes: attrs)
    }
    
    
    static func getSystemFont(text: String,
                              size: CGFloat,
                              color: UIColor,
                              align: NSTextAlignment = .left) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = align
        
        let attrs: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: size),
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        return NSAttributedString(string: text, attributes: attrs)
    }
}
