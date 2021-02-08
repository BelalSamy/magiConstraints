//
//  UIView.swift
//  PexelsClone
//
//  Created by Belal Samy on 2/4/21.
//  Copyright © 2021 Belal Samy. All rights reserved.
//

import UIKit

public extension UIView {
    
    //MARK:- Enums
    
    enum X {
        case leading(UIView?, CGFloat) // nil = superview
        case trailing(UIView?, CGFloat) // nil = superview
        case center(UIView?) // nil = superview
    }
    
    enum W {
        case wrapContent
        case fixed(CGFloat)
        case equal(UIView?, CGFloat) // nil = superview
    }
    
    enum Y {
       case top(UIView?, CGFloat) // nil = superview
       case bottom(UIView?, CGFloat) // nil = superview
       case center(UIView?) // nil = superview
    }
    
    enum H {
       case wrapContent
       case fixed(CGFloat)
       case equal(UIView?, CGFloat) // nil = superview
    }
    
    enum XW {
        case leadingAndCenter(UIView?, CGFloat) // nil = superview
        case trailingAndCenter(UIView?, CGFloat) // nil = superview
        case leadingAndTrailing(UIView?, CGFloat, UIView?, CGFloat) // nil = superview
        case leadingAndTrailingAndWidth(UIView?, CGFloat, UIView?, CGFloat, W) // nil = superview
    }
    
    enum YH {
        case topAndCenter(UIView?, CGFloat) // nil = superview
        case bottomAndCenter(UIView?, CGFloat) // nil = superview
        case topAndBottom(UIView?, CGFloat, UIView?, CGFloat) // nil = superview
        case topAndBottomAndHeight(UIView?, CGFloat, UIView?, CGFloat, H) // nil = superview
    }
    
    //MARK:- ADD SUBVIEWS
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }

    //MARK:- (1) XWYH
    func magiConstraints(X: X, W: W, Y: Y, H: H) {
        miniConstraints(X: X)
        miniConstraints(W: W)
        miniConstraints(Y: Y)
        miniConstraints(H: H)
    }
    
    //MARK:- (2) XW, Y, H
    func magiConstraints(XW: XW, Y: Y, H: H) {
        miniConstraints(XW: XW)
        miniConstraints(Y: Y)
        miniConstraints(H: H)
    }
    
    //MARK:- (3) X, W, YH
    func magiConstraints(X: X, W: W, YH: YH) {
        miniConstraints(X: X)
        miniConstraints(W: W)
        miniConstraints(YH: YH)
    }
    
    //MARK:- (4) XW, YH
    func magiConstraints(XW: XW, YH: YH) {
        miniConstraints(XW: XW)
        miniConstraints(YH: YH)
    }
    
} // extention
