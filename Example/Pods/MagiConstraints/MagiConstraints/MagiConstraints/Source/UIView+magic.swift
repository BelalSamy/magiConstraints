//
//  UIView+magic.swift
//  Pods
//
//  Created by Belal Samy on 24/06/2021.
//

import Foundation
import UIKit

extension UIView {

    //MARK:- Func - fakeViews
    public func fakeViews(_ quantity: Int) -> [UIView] {
        // Note: to cast views to any other view type >>> as! [UIImageView]
        var views = [UIView]()
        (0..<quantity).forEach { _ in
            let view = UIView()
            views.append(view)
        }
        
        return views
    }
    
    //MARK:- Func - labelit
    public func justLabelIt(_ text: String, _ size: CGFloat) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.textAlignment = .center
        self.addSubview(label)
        label.frame = self.frame // didnt support ladscape orientation
    }
    
    //MARK:- Func - magicView
    
    public enum Shape {
        case square(size: CGFloat, cornerRadius: CGFloat)
        case circle(size: CGFloat)
        case custom(H: CGFloat, W: CGFloat, cornerRadius: CGFloat)
    }
    
    public func magiCreate(color: UIColor?, shape: Shape) -> UIView {
        self.clipsToBounds = true
        
        let view = UIView()
        
        if color != nil {
            view.backgroundColor = color
        }

        switch shape {
        // square
        case .square(let size, let cornerRadius):
            view.miniConstraints(W: .fixed(size), H: .fixed(size))
            view.layer.cornerRadius = cornerRadius
        
        // circle
        case .circle(let size):
            view.miniConstraints(W: .fixed(size), H: .fixed(size))
            view.layer.cornerRadius = size / 2
        
        // custom
        case .custom(let H, let W, let cornerRadius):
            view.miniConstraints(W: .fixed(W), H: .fixed(H))
            view.layer.cornerRadius = cornerRadius
        }
        
        return view
    }
    
    
    //MARK:- Func - magicAnimation
    public enum transform {
        case animate(X: CGFloat, Y: CGFloat)
        case rotate(angle: CGFloat)
        case original
    }
    
    public func magicAnimation(views: [UIView?]?, duration: TimeInterval, velocity: CGFloat, animation: UIView.AnimationOptions ,transform: transform) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity, options: animation) {
            switch transform {

            case .animate(let X, let Y):
                // transform
                let transform = CGAffineTransform(translationX: X, y: Y)
                
                self.transform = transform
                if views != nil {
                    views!.forEach { view in
                        view?.transform = transform
                    }
                }
                
            case .rotate(let angle):
                let rotationalTransformation = CGAffineTransform(rotationAngle: angle)
                if views != nil {
                    views!.forEach { view in
                        view?.transform = rotationalTransformation
                    }
                }
            
            case .original:
                self.transform = CGAffineTransform.identity
                if views != nil {
                    views!.forEach { view in
                        view?.transform = CGAffineTransform.identity
                    }
                }
            }
        }
    }
    
    
    //MARK:- Func - magicGradient
    public func magicGradient(colors: [UIColor], locations: [NSNumber]) {
        // not working well .. so make sure to add (( override func layoutsubviews )
        let gradientLayer = CAGradientLayer()

        // turn colors into cgcolors
        var CGColors = [CGColor]()
        colors.forEach { color in
            CGColors.append(color.cgColor)
        }
        
        // Add colors and locations
        gradientLayer.colors = CGColors
        gradientLayer.locations = locations
        
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
    
    //MARK:- Func - returnMagicGradient
    public func returnMagicGradient(colors: [UIColor], locations: [NSNumber]) -> CAGradientLayer {
        // not working well .. so make sure to add (( override func layoutsubviews )
        let gradientLayer = CAGradientLayer()

        // turn colors into cgcolors
        var CGColors = [CGColor]()
        colors.forEach { color in
            CGColors.append(color.cgColor)
        }
        
        // Add colors and locations
        gradientLayer.colors = CGColors
        gradientLayer.locations = locations
        
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
        return gradientLayer
    }
    
    //MARK:- Func - magicShadow
    public func magicShadow(color: UIColor, opacity: Float = 0.5, H: CGFloat, W: CGFloat, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: W, height: H)
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
