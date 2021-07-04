//
//  UIView+returnMagiConstraints.swift
//  Pods
//
//  Created by Belal Samy on 25/06/2021.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK:- return X Only
    public func returnMagiConstraint(X: X) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        translatesAutoresizingMaskIntoConstraints = false

         switch X {
         case .leading(let view, let value):
             if let view = view {
                constraint = self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: value)
                constraint.isActive = true
             } else {
                constraint = self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: value)
                constraint.isActive = true
             }
             
         case .trailing(let view, let value):
             if let view = view {
                constraint = self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -value)
                constraint.isActive = true
             } else {
                constraint = self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -value)
                constraint.isActive = true
             }
             
         case .center(let view):
             if let view = view {
                constraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                constraint.isActive = true
             } else {
                constraint = self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor)
                constraint.isActive = true
             }
             
         case .leadingToSafeArea(let view, let value):
            if let view = view {
                constraint = self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: value)
                constraint.isActive = true
            } else {
                constraint = self.leadingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leadingAnchor, constant: -value)
                constraint.isActive = true
            }
            

         case .trailingToSafeArea(let view, let value):
            if let view = view {
                constraint = self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: value)
                constraint.isActive = true
            } else {
                constraint = self.trailingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.trailingAnchor, constant: -value)
                constraint.isActive = true
            }
             
         }
        return constraint
     }
    
}
