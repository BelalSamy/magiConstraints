//
//  UIStackView+magic.swift
//  Pods
//
//  Created by Belal Samy on 24/06/2021.
//

import Foundation
import UIKit

public extension UIStackView {
    //Enums
    enum axis {
        case horizontal
        case vertical
    }
    
    enum distribution {
        case equalCentering(CGFloat)
        case equalSpacing(CGFloat)
        case fill(CGFloat)
        case fillEqually(CGFloat)
        case fillProportionally(CGFloat)
        case custom([CGFloat])
        case spacing(CGFloat)
    }

    
    //MARK:- Func - magiCreate
    func magiCreate(subviews: [UIView], colors: [UIColor], axis: axis?, distribution: distribution?) {
        // create stackview in one line ( like magic )

        //subviews
        for view in subviews {
            addArrangedSubview(view)
        }
        
        //colors
        for (index, view) in subviews.enumerated() {
            // let color = colors.count < index + 1 ? colors.last : colors[index]
            let color = MagicPattern.set(colors, to: index)
            view.backgroundColor = color
        }
        
        //axis
        if axis != nil {
            switch axis {
            case .horizontal:
                self.axis = .horizontal
            case .vertical:
                self.axis = .vertical
            case .none:
                ()
            }
        }
      
        //distribution
        if distribution != nil {
            switch distribution {
            case .equalCentering(let spacingValue):
                self.distribution = .equalCentering
                self.spacing = spacingValue
                
            case .equalSpacing(let spacingValue):
                self.distribution = .equalSpacing
                self.spacing = spacingValue
                self.isLayoutMarginsRelativeArrangement = true
                self.layoutMargins = .init(top: 0, left: spacingValue, bottom: 0, right: spacingValue)
                
            case .fill(let spacingValue):
                self.distribution = .fill
                self.spacing = spacingValue
                
            case .fillEqually(let spacingValue):
                self.distribution = .fillEqually
                self.spacing = spacingValue
                
            case .fillProportionally(let spacingValue):
                self.distribution = .fillProportionally
                self.spacing = spacingValue
                
            case .custom(let ratios):
                var sumOfRatios = CGFloat() // get the sum first
                for (index, _) in subviews.enumerated() {
                    let ratio = MagicPattern.set(ratios, to: index)
                    sumOfRatios = sumOfRatios + ratio
                }
                    
                for (index, view) in subviews.enumerated() {
                    let ratio = MagicPattern.set(ratios, to: index)
                    var percentage = CGFloat()
                    percentage = (ratio / sumOfRatios)
                    
                    //print("percentage >>> \(percentage * 100) %")
                    if self.axis == .vertical {
                        view.miniConstraints(H: .equal(nil, percentage))
                    } else {
                        view.miniConstraints(W: .equal(nil, percentage))
                  
                    }
                }
                    
            case .spacing(let spacingValue):
                self.spacing = spacingValue

            default:
                ()
            }

        }
    }
    
    //MARK:- Func - selectColor
    func selectColor(index: Int, selected: UIColor, unselected: UIColor) {
        subviews.forEach { view in
            view.backgroundColor = unselected
        }
        self.subviews[index].backgroundColor = selected
    }
    
    //MARK:- Func - fakeBtns
    func fakeBtns(icons: [UIImage]) -> [UIView] {
        icons.map { (img) -> UIView in
            let btn = UIButton(type: .system)
            btn.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
            return btn
        }
    }
}

