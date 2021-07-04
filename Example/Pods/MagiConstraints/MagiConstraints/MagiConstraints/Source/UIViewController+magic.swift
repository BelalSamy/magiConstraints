//
//  UIViewController+addSubViewControllers.swift
//  Pods
//
//  Created by Belal Samy on 21/06/2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK:- Func - addSubViewController
    public func addSubViewController(_ viewController: UIViewController, inside: UIView) {
        inside.addSubview(viewController.view)
        self.addChild(viewController)
    }
    
    //MARK:- Func - addSubViewControllers
    public func addSubViewControllers(_ viewControllers: [UIViewController?], inside: [UIView]) {
        for (index, viewController) in viewControllers.enumerated() {
            inside[index].addSubview(viewController!.view)
            self.addChild(viewController!)
        }
    }
    
    //MARK:- Func - removeViewController
    public func removeSubViewController(_ viewController: UIViewController) {
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }

}
