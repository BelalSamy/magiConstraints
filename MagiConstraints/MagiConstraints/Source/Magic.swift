//
//  Magic.swift
//  MagiConstraints
//
//  Created by Belal Samy on 17/06/2021.
//

import Foundation
import UIKit

public class Magic {
    
    //MARK:- Create Text
    public static func create(text: [String], size: [CGFloat], weight: [UIFont.Weight]) -> NSMutableAttributedString {
        var attributeText: NSMutableAttributedString!
        for (index, t) in text.enumerated() {
            if index == 0 {
                attributeText = NSMutableAttributedString(string: t, attributes: [.font: UIFont.systemFont(ofSize: size[index], weight: weight[index])])
            } else {
                attributeText.append(NSMutableAttributedString(string: t, attributes: [.font: UIFont.systemFont(ofSize: size[index], weight: weight[index])]))
            }
        }
        return attributeText
    }
}

