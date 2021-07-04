//
//  ViewController.swift
//  Example
//
//  Created by Belal Samy on 2/8/21.
//  Copyright © 2021 Belal Samy. All rights reserved.
//

import UIKit
import MagiConstraints

class ViewController: UIViewController {
    
    //MARK:- VIEWS
    var scrollView = UIScrollView()
    var containerView = UIView()
    var label = UILabel()
    var greenView = UIView()
    var stackView = UIStackView()
    var subviews = ViewsFactory.views(7)


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }


    // MARK:- SETUP VIEWS

    func setupViews() {
        setMagiConstraints()
        setViewsProperties()
    }

    func setMagiConstraints() {
        view.addSubview(scrollView)
        // create dynamic scrollview in one line ( magiCreate)
        scrollView.magiCreate(container: containerView)
        containerView.addSubviews([label, greenView])
        
        greenView.addSubview(stackView)
        // create stackView in one line ( magiCreate)
        stackView.magiCreate(subviews: subviews, colors: [.red, .green, .yellow, .brown], axis: .vertical, distribution: .fillEqually(20))

        // magic constraints ( satisify all constraints in one line - like magic )
        label.magiConstraints(XW: .leadingAndCenter(nil, 20), YH: .TopAndBottom(nil, 20, greenView, 20))
        greenView.magiConstraints(XW: .leadingAndCenter(nil, 20), Y: .bottom(nil, 20), H: .fixed(500))
        stackView.magiConstraints(XW: .leadingAndCenter(nil, 20), YH: .topAndCenter(nil, 20))
        
    }

    func setViewsProperties() {
        // background colors
        scrollView.backgroundColor = UIColor.black
        containerView.backgroundColor = UIColor.lightGray
        greenView.backgroundColor = UIColor.darkGray
        label.backgroundColor = .darkGray
        label.textColor = .white

        // label
        label.numberOfLines = 0
        label.text = " just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test  just a text to test"
    }
}

