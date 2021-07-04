//
//  UIScrollView+magic.swift
//  Pods
//
//  Created by Belal Samy on 24/06/2021.
//

import Foundation
import UIKit

public extension UIScrollView {
    
    //MARK:- Func - magiCreate
    func magiCreate(container: UIView) {
        // create dynamic scrollview in one line ( like magic )
        self.addSubview(container)
        self.magiConstraints(XW: .leadingAndCenter(nil, 0), YH: .TopAndBottom(nil, 0, nil, 0))
        container.magiConstraints(XW: .leadingAndCenter(nil, 0), YH: .TopAndBottom(nil, 0, nil, 0))
    
        self.autoresizingMask = .flexibleHeight
        self.bounces = true
        self.showsHorizontalScrollIndicator = true
    }
}
