//
//  UILabel+magic.swift
//  Pods
//
//  Created by Belal Samy on 24/06/2021.
//

import Foundation
import UIKit

extension UILabel {
    //MARK:- Func - magicText
    public func magicText(string: [String], colors: [UIColor], sizes: [CGFloat], weights: [UIFont.Weight], alignment: NSTextAlignment) -> NSAttributedString {
        
        let result = NSMutableAttributedString()
        var baseAttributeText = NSAttributedString()
        var otherAttributeText = NSAttributedString()
        
        for (index, t) in string.enumerated() {
            let color = MagicPattern.set(colors, to: index)
            let size = MagicPattern.set(sizes, to: index)
            let weight = MagicPattern.set(weights, to: index)

            if index == 0 {
                baseAttributeText = NSAttributedString(string: t, attributes: [.foregroundColor: color, .font: UIFont.systemFont(ofSize: size, weight: weight)])
                result.append(baseAttributeText)
            } else {
                otherAttributeText = NSAttributedString(string: t, attributes: [.foregroundColor: color, .font: UIFont.systemFont(ofSize: size, weight: weight)])
                result.append(otherAttributeText)
            }
        }
        
        self.numberOfLines = 0
        self.textAlignment = alignment
        return result
    }

}
