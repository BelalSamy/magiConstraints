//
//  UIStackView+magiCreate.swift
//  PexelsClone
//
//  Created by Belal Samy on 2/7/21.
//  Copyright © 2021 Belal Samy. All rights reserved.
//

import UIKit

//MARK:- MAGIC STACKVIEW

public extension UIStackView {
    
    //MARK:- Enums
    
    enum direction {
        case horizontal
        case vertical
    }
    
    enum distribution {
        case equalCentering(CGFloat)
        case equalSpacing(CGFloat)
        case fill(CGFloat)
        case fillEqually(CGFloat)
        case fillProportionally(CGFloat)
    }
    
    // MARK:- magiCreate
    // create stackview in one line ( like magic )
    func magiCreate(subviews: [UIView], direction: direction, distribution: distribution) {
        
        // subviews
        for view in subviews {
            addArrangedSubview(view)
        }
        
        // axis
        switch direction {
        case .horizontal:
            self.axis = .horizontal
        case .vertical:
            self.axis = .vertical
        }
        
        // distribution
        switch distribution {
            
        case .equalCentering(let spacingValue):
            self.distribution = .equalCentering
            self.spacing = spacingValue
            
        case .equalSpacing(let spacingValue):
            self.distribution = .equalSpacing
            self.spacing = spacingValue
            
        case .fill(let spacingValue):
            self.distribution = .fill
            self.spacing = spacingValue
            
        case .fillEqually(let spacingValue):
            self.distribution = .fillEqually
            self.spacing = spacingValue
            
        case .fillProportionally(let spacingValue):
            self.distribution = .fillProportionally
            self.spacing = spacingValue
        }
    }
} // extenstion
