//
//  UITextField + magic.swift
//  Pods
//
//  Created by Belal Samy on 01/07/2021.
//

import Foundation
import UIKit

//MARK:- MagicPattern
public enum PatternType {
    case smart
    case reverse
    case random
}

class MagicPattern {
    public static func set<P>(_ arrOfProperty: [P], _ patternType: PatternType = .smart, to index: Int) -> P {
        var property: P
        var patternIndex = 0

        switch patternType {
        case .smart:
            let originalIndex = index - arrOfProperty.count * ( index / arrOfProperty.count )
            patternIndex = originalIndex
            
        case .reverse:
            let originalIndex = index - arrOfProperty.count * ( index / arrOfProperty.count )
            let reverseIndex = (index / arrOfProperty.count) % 2 == 0 ? originalIndex : arrOfProperty.count - 1 - originalIndex
            patternIndex = reverseIndex
            
        case .random:
            let randomIndex = Int.random(in: 0..<arrOfProperty.count)
            patternIndex = randomIndex
        }
            
        property = arrOfProperty.count - 1 < index ? arrOfProperty[patternIndex] : arrOfProperty[index]
        return property
    }
}


//MARK:-  Reusable Enums
public enum Shape {
    case square(size: CGFloat, cornerRadius: CGFloat)
    case circle(size: CGFloat)
    case custom(H: CGFloat, W: CGFloat, cornerRadius: CGFloat)
}

//MARK:- set Buttons
extension Array where Element == UIButton {
    public func set(icons: [UIImage]? = nil,
                    titles: [String]? = nil,
                    corners: [CGFloat]? = nil ,
                    titleColors: [UIColor]? = nil,
                    sizes: [CGFloat]? = nil,
                    weights: [UIFont.Weight]? = nil,
                    alignments: [NSTextAlignment]? = nil) -> [UIButton] {
        
        var result = [UIButton]()
        for (index, btn) in self.enumerated() {
            let icon = MagicPattern.set(icons ?? [UIImage()], to: index)
            let title = MagicPattern.set(titles ?? [String()], to: index)
            let titleColor = MagicPattern.set(titleColors ?? [.black], to: index)
            let size = MagicPattern.set(sizes ?? [CGFloat()], to: index)
            let weight = MagicPattern.set(weights ?? [.regular], to: index)
            let alignment = MagicPattern.set(alignments ?? [.left], to: index)
            let corner = MagicPattern.set(corners ?? [CGFloat()], to: index)
            
            btn.setTitle(title, for: .normal)
            btn.layer.cornerRadius = corner
            btn.setTitleColor(titleColor, for: .normal)
            btn.setImage(icon.withRenderingMode(.alwaysOriginal), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: weight)
            btn.titleLabel?.textAlignment = alignment
            result.append(btn)
        }
        return result
    }
}


//MARK:- set TextFields
extension Array where Element == customTextField {
    public func set(placeHolders: [String]! = nil,
                    corners: [CGFloat]? = nil,
                    textColors: [UIColor]? = nil,
                    sizes: [CGFloat]? = nil,
                    weights: [UIFont.Weight]? = nil,
                    alignments: [NSTextAlignment]? = nil) -> [customTextField] {
        
        var result = [customTextField]()
        for (index, tf) in self.enumerated() {
            let placeHolder = MagicPattern.set(placeHolders, to: index)
            let textColor = MagicPattern.set(textColors ?? [.gray], to: index)
            let size = MagicPattern.set(sizes ?? [CGFloat()], to: index)
            let weight = MagicPattern.set(weights ?? [.regular], to: index)
            let alignment = MagicPattern.set(alignments ?? [.left], to: index)
            let corner = MagicPattern.set(corners ?? [CGFloat()], to: index)

            tf.placeholder = placeHolder
            tf.textColor = textColor
            tf.font = UIFont.systemFont(ofSize: size, weight: weight)
            tf.textAlignment = alignment
            tf.layer.cornerRadius = corner

            result.append(tf)
        }
        return result
    }
}


//MARK:- set ImageViews
extension Array where Element == UIImageView {
    public func set(images: [UIImage]? = nil,
                    scales: [UIImageView.ContentMode]? = nil,
                    shapes: [Shape]? = nil) -> [UIImageView] {
        
        var result = [UIImageView]()
        for (index, iv) in self.enumerated() {
            let image = MagicPattern.set(images ?? [UIImage()], to: index)
            let scale = MagicPattern.set(scales ?? [.scaleAspectFit], to: index)
            let shape = MagicPattern.set(shapes ?? [], to: index)
            
            // shape
            switch shape {
            case .square(let size, let cornerRadius):
                iv.miniConstraints(W: .fixed(size), H: .fixed(size))
                iv.layer.cornerRadius = cornerRadius
            
            case .circle(let size):
                iv.miniConstraints(W: .fixed(size), H: .fixed(size))
                iv.layer.cornerRadius = size / 2
            
            case .custom(let H, let W, let cornerRadius):
                iv.miniConstraints(W: .fixed(W), H: .fixed(H))
                iv.layer.cornerRadius = cornerRadius
            }
            
            iv.image = image
            iv.contentMode = scale
            iv.clipsToBounds = true
            result.append(iv)
        }
        return result
    }
}

