//
//  UIImageView+magic.swift
//  Pods
//
//  Created by Belal Samy on 24/06/2021.
//

import Foundation
import UIKit

extension UIImageView {
    
    public enum Shape {
        case square(size: CGFloat, cornerRadius: CGFloat)
        case circle(size: CGFloat)
        case custom(H: CGFloat, W: CGFloat, cornerRadius: CGFloat)
    }
    
    //MARK:- Func - magicImage
    public func magicImage(name: String, scale: ContentMode, shape: Shape) -> UIImage {
        let image = UIImage(named: name)
        self.contentMode = scale
        self.clipsToBounds = true

        switch shape {
        // square
        case .square(let size, let cornerRadius):
            self.miniConstraints(W: .fixed(size), H: .fixed(size))
            self.layer.cornerRadius = cornerRadius
        
        // circle
        case .circle(let size):
            self.miniConstraints(W: .fixed(size), H: .fixed(size))
            self.layer.cornerRadius = size / 2
        
        // custom
        case .custom(let H, let W, let cornerRadius):
            self.miniConstraints(W: .fixed(W), H: .fixed(H))
            self.layer.cornerRadius = cornerRadius
        }
        
        return image!
    }
}
