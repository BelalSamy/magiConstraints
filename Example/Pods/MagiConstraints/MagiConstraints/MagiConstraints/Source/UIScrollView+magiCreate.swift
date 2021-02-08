//
//  UIScrollView+magiCreate.swift
//  PexelsClone
//
//  Created by Belal Samy on 2/7/21.
//  Copyright © 2021 Belal Samy. All rights reserved.
//

import UIKit

//MARK:- MAGIC SCROLLVIEW

public extension UIScrollView {
    
    // MARK:- magiCreate
    // create dynamic scrollview in one line ( like magic )
    
    func magiCreate(container: UIView) {
        self.addSubview(container)
        self.magiConstraints(XW: .leadingAndCenter(nil, 0), YH: .topAndBottom(nil, 0, nil, 0))
        container.magiConstraints(XW: .leadingAndCenter(nil, 0), YH: .topAndBottom(nil, 0, nil, 0))
    
        self.autoresizingMask = .flexibleHeight
        self.bounces = true
        self.showsHorizontalScrollIndicator = true
    }
} // extension
