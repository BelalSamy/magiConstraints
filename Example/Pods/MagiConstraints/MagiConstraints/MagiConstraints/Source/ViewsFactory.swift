//
//  ViewsFactory.swift
//  Pods
//
//  Created by Belal Samy on 01/07/2021.
//

import Foundation
import UIKit

//MARK:- Custom Views
public class customTextField: UITextField {
    public override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 50)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
}


//MARK:- Factory
public class ViewsFactory {
    
    //MARK:- Views
    public static func views(_ quantity: Int) -> [UIView] {
        // Note: to cast views to any other view type >>> as! [UILabel]
        var views = [UIView]()
        (0..<quantity).forEach { _ in
            let view = UIView()
            views.append(view)
        }
        return views
    }
    
    //MARK:- Buttons
    public static func buttons(_ quantity: Int) -> [UIButton] {
        var views = [UIButton]()
        (0..<quantity).forEach { _ in
            let view = UIButton()
            views.append(view)
        }
        return views
    }

    //MARK:- TextFields
    public static func textFields(_ quantity: Int) -> [customTextField] {
        var views = [customTextField]()
        (0..<quantity).forEach { _ in
            let view = customTextField()
            views.append(view)
        }
        return views
    }
    
    //MARK:- ImageViews
    public static func imageViews(_ quantity: Int) -> [UIImageView] {
        var views = [UIImageView]()
        (0..<quantity).forEach { _ in
            let view = UIImageView()
            views.append(view)
        }
        return views
    }
    
}
