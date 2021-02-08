//
//  UIView+individualConstriants.swift
//  PexelsClone
//
//  Created by Belal Samy on 2/7/21.
//  Copyright © 2021 Belal Samy. All rights reserved.
//

import UIKit

public extension UIView {
    
    
    //MARK:- Size Only - W, H
           
        func miniConstraints(W: W, H: H) {
            translatesAutoresizingMaskIntoConstraints = false
                     
            switch W {
            case .wrapContent:
               let targetSize = CGSize(width: 10000, height: frame.width) // make the width very big
               let estimatedSize = self.systemLayoutSizeFitting(targetSize)
               self.widthAnchor.constraint(equalToConstant: estimatedSize.width).isActive = true
                      
             case .fixed(let value):
               if value != 0 {
                self.widthAnchor.constraint(equalToConstant: value).isActive = true
               }
                
            case .equal(let view, let multiplier):
                if let view = view {
                   self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
                } else {
                   self.widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: multiplier).isActive = true
                }
            }
            
           
            switch H {
            case .wrapContent:
               let targetSize = CGSize(width: frame.width, height: 10000) // make the height very big
               let estimatedSize = self.systemLayoutSizeFitting(targetSize)
               heightAnchor.constraint(equalToConstant: estimatedSize.height).isActive = true
                
             case .fixed(let value):
               if value != 0 {
                heightAnchor.constraint(equalToConstant: value).isActive = true
               }
                
             case .equal(let view, let multiplier):
               if let view = view {
                   self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
               } else {
                   self.heightAnchor.constraint(equalTo: superview!.heightAnchor, multiplier: multiplier).isActive = true
               }

            }
        }
           
       //MARK:- Position Only - X, Y
           
       func miniConstraints(X: X, Y: Y) {
             translatesAutoresizingMaskIntoConstraints = false
             
             switch X {
             case .leading(let view, let value):
                 if let view = view {
                     self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: value).isActive = true
                 } else {
                     self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: value).isActive = true
                 }
                 
             case .trailing(let view, let value):
                 if let view = view {
                     self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -value).isActive = true
                 } else {
                     self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -value).isActive = true
                 }
                 
             case .center(let view):
                 if let view = view {
                     self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 } else {
                     self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
                 }
         
             }
             
             
             switch Y {
             case .top(let view, let value):
                 if let view = view {
                     self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: value).isActive = true
                 } else {
                     self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: value).isActive = true
                 }
                 
             case .bottom(let view, let value):
                 if let view = view {
                     self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -value).isActive = true
                 } else {
                     self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -value).isActive = true
                 }
                 
             case .center(let view):
                 if let view = view {
                     self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                 } else {
                     self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
                 }
             }
         }
       
       //MARK:- X Only
       func miniConstraints(X: X) {
            translatesAutoresizingMaskIntoConstraints = false
           
            switch X {
            case .leading(let view, let value):
                if let view = view {
                    self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: value).isActive = true
                } else {
                    self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: value).isActive = true
                }
                
            case .trailing(let view, let value):
                if let view = view {
                    self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -value).isActive = true
                } else {
                    self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -value).isActive = true
                }
                
            case .center(let view):
                if let view = view {
                    self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                } else {
                    self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
                }
            }
        }
       
       //MARK:- W Only
       func miniConstraints(W: W) {
            translatesAutoresizingMaskIntoConstraints = false
                     
            switch W {
            case .wrapContent:
                let targetSize = CGSize(width: 10000, height: frame.width) // make the width very big
                let estimatedSize = self.systemLayoutSizeFitting(targetSize)
                self.widthAnchor.constraint(equalToConstant: estimatedSize.width).isActive = true
                
              case .fixed(let value):
                if value != 0 {
                self.widthAnchor.constraint(equalToConstant: value).isActive = true
                }
                
            case .equal(let view, let multiplier):
                if let view = view {
                     self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
                } else {
                    self.widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: multiplier).isActive = true
                }
            }
        }
       
       
       //MARK:- Y Only
       func miniConstraints(Y: Y) {
            translatesAutoresizingMaskIntoConstraints = false
            
            switch Y {
            case .top(let view, let value):
                if let view = view {
                    self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: value).isActive = true
                } else {
                    self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: value).isActive = true
                }
                
            case .bottom(let view, let value):
                if let view = view {
                    self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -value).isActive = true
                } else {
                    self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -value).isActive = true
                }
                
            case .center(let view):
                if let view = view {
                    self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                } else {
                    self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
                }
            }
        }
       
       
       //MARK:- H Only
       func miniConstraints(H: H) {
            translatesAutoresizingMaskIntoConstraints = false
            
            switch H {
            case .wrapContent:
                let targetSize = CGSize(width: frame.width, height: 10000) // make the height very big
                let estimatedSize = self.systemLayoutSizeFitting(targetSize)
                heightAnchor.constraint(equalToConstant: estimatedSize.height).isActive = true
                
            case .fixed(let value):
                if value != 0 {
                heightAnchor.constraint(equalToConstant: value).isActive = true
                }
                
            case .equal(let view, let multiplier):
                if let view = view {
                    self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
                } else {
                    self.heightAnchor.constraint(equalTo: superview!.heightAnchor, multiplier: multiplier).isActive = true
                }
            }
        }
       
       
       //MARK:- XW Only
       func miniConstraints(XW: XW) {
       translatesAutoresizingMaskIntoConstraints = false
             
       switch XW {
           case .leadingAndCenter(let view, let value):
               if let view = view {
                   self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: value).isActive = true
                   self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
               } else {
                   self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: value).isActive = true
                   self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
               }

           case .trailingAndCenter(let view, let value):
               if let view = view {
                   self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -value).isActive = true
                   self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
               } else {
                   self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -value).isActive = true
                   self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
               }
               
           case .leadingAndTrailing(let view1, let value1, let view2, let value2):
               if let view1 = view1 {
                   self.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: value1).isActive = true
               } else {
                   self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: value1).isActive = true
               }
               
               if let view2 = view2 {
                   self.trailingAnchor.constraint(equalTo: view2.leadingAnchor, constant: -value2).isActive = true
               } else {
                   self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -value2).isActive = true
               }
           
           case .leadingAndTrailingAndWidth(let view1, let value1, let view2, let value2, let W):
               if let view1 = view1 {
                   self.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: value1).isActive = true
               } else {
                   self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: value1).isActive = true
               }
               
               if let view2 = view2 {
                   self.trailingAnchor.constraint(equalTo: view2.leadingAnchor, constant: -value2).isActive = true
               } else {
                   self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -value2).isActive = true
               }
           
               switch W {
                 case .wrapContent:
                     let targetSize = CGSize(width: 10000, height: frame.width) // make the width very big
                     let estimatedSize = self.systemLayoutSizeFitting(targetSize)
                     self.widthAnchor.constraint(equalToConstant: estimatedSize.width).isActive = true
                     
                   case .fixed(let value):
                     if value != 0 {
                     self.widthAnchor.constraint(equalToConstant: value).isActive = true
                     }
                     
                 case .equal(let view, let multiplier):
                     if let view = view {
                          self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
                     } else {
                         self.widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: multiplier).isActive = true
                     }
                 }
           
           }
       }
       
       //MARK:- YH Only
       func miniConstraints(YH: YH) {
       translatesAutoresizingMaskIntoConstraints = false
           
          switch YH {
               case .topAndCenter(let view, let value):
                if let view = view {
                    self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: value).isActive = true
                    self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
                } else {
                    self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: value).isActive = true
                    self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
                }
                
               case .bottomAndCenter(let view, let value):
                if let view = view {
                    self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -value).isActive = true
                    self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
                } else {
                    self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -value).isActive = true
                    self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
                }
                
               case .TopAndBottom(let view1, let value1, let view2, let value2):
                if let view1 = view1 {
                    self.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: value1).isActive = true
                } else {
                    self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: value1).isActive = true
                }
                
                if let view2 = view2 {
                    self.bottomAnchor.constraint(equalTo: view2.topAnchor, constant: -value2).isActive = true
                } else {
                    self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -value2).isActive = true
                }
           
               case .TopAndBottomAndHeight(let view1, let value1, let view2, let value2, let H):
                    if let view1 = view1 {
                        self.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: value1).isActive = true
                    } else {
                        self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: value1).isActive = true
                    }
                    
                    if let view2 = view2 {
                        self.bottomAnchor.constraint(equalTo: view2.topAnchor, constant: -value2).isActive = true
                    } else {
                        self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -value2).isActive = true
                    }
                 
                 switch H {
                 case .wrapContent:
                     let targetSize = CGSize(width: frame.width, height: 10000) // make the height very big
                     let estimatedSize = self.systemLayoutSizeFitting(targetSize)
                     heightAnchor.constraint(equalToConstant: estimatedSize.height).isActive = true
                     
                 case .fixed(let value):
                     if value != 0 {
                     heightAnchor.constraint(equalToConstant: value).isActive = true
                     }
                     
                 case .equal(let view, let multiplier):
                     if let view = view {
                         self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
                     } else {
                         self.heightAnchor.constraint(equalTo: superview!.heightAnchor, multiplier: multiplier).isActive = true
                     }
                 }
          }
       }
} // extenstion
