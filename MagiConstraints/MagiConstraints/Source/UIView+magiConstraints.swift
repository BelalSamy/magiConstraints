//
//  UIView.swift
//  PexelsClone
//
//  Created by Belal Samy on 2/4/21.
//  Copyright © 2021 Belal Samy. All rights reserved.
//

import UIKit

public extension UIView {
    
    //MARK:- ADD SUBVIEWS
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func addSubviews(parentViews: [UIView], viewsArray: [[UIView]]) {
        for parent in parentViews {
            for views in viewsArray {
                parent.addSubviews(views)
            }
        }
    }
    
//MARK:- MAGIC CONSTRAINTS
    
    /* Notes ----------------------
    - magiConstraints is syntactic sugar to make autolayout easier to use
    - the idea is to satisfy all 4 constraints ( x-axis, width, y-axis, height ) in one line function
    - by covering variations of each constraint cases using enums parameters
    - nil = superview "by default"
    - so its easy to change superview without change alot of code
    - also (nil) is very short word so didnt take much text
     
    - constraints behave different if it's attach to ( superview or any another view )
        superview :
            - leading to ( leading ) of ( superview )
            - trailing to ( trailing ) of ( superview )
            - top to ( top ) of ( superview )
            - bottom to ( bottom ) of ( superview )
     
         any other view :
             - leading to ( trailing ) of ( view )
             - trailing to ( leading ) of ( view )
             - top to ( bottom ) of ( view )
             - bottom to ( top ) of ( view )
    */

    //MARK:- Enums
    
    enum X {
        case leading(UIView?, CGFloat) // nil = superview
        case trailing(UIView?, CGFloat) // nil = superview
        case center(UIView?) // nil = superview
        // safeArea
        case leadingToSafeArea(UIView?, CGFloat)
        case trailingToSafeArea(UIView?, CGFloat)
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
        // safeArea
       case topToSafeArea(UIView?, CGFloat)
       case bottomToSafeArea(UIView?, CGFloat)

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
        // safeArea
        case leadingAndTrailingBothToSafeArea(UIView?, CGFloat, UIView?, CGFloat) // nil = superview
        case leadingToSafeAreaAndTrailingAndWidth(UIView?, CGFloat, UIView?, CGFloat, W) // nil = superview
        case leadingAndTrailingToSafeAreaAndWidth(UIView?, CGFloat, UIView?, CGFloat, W) // nil = superview
    }
    
    enum YH {
        case topAndCenter(UIView?, CGFloat) // nil = superview
        case bottomAndCenter(UIView?, CGFloat) // nil = superview
        case TopAndBottom(UIView?, CGFloat, UIView?, CGFloat) // nil = superview
        case TopAndBottomAndHeight(UIView?, CGFloat, UIView?, CGFloat, H) // nil = superview
        // safeArea
        case TopAndBottomBothToSafeArea(UIView?, CGFloat, UIView?, CGFloat) // nil = superview
        case TopToSafeAreaAndBottomAndHeight(UIView?, CGFloat, UIView?, CGFloat, H) // nil = superview
        case TopAndBottomToSafeAreaAndHeight(UIView?, CGFloat, UIView?, CGFloat, H) // nil = superview
    }
    
    enum Shortcut {
        case fillSuperView(CGFloat)
        case fillToSafeArea(UIView?, CGFloat, UIView?, CGFloat) // nil = superview
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
    
    //MARK:- (5) Shortcuts for common Scenarios
    func magiConstraints(shortcut: Shortcut) {
        switch shortcut {
        
        case .fillSuperView(let value):
            magiConstraints(XW: .leadingAndCenter(nil, value), YH: .topAndCenter(nil, value))
            
        case .fillToSafeArea(let view1, let value1, let view2, let value2):
            magiConstraints(XW: .leadingAndCenter(nil, 0), YH: .TopAndBottomBothToSafeArea(view1, value1, view2, value2))

        }
    }
    
} // extention
