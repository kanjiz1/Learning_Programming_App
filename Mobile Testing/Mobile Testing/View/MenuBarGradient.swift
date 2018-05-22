//
//  MenuBarGradient.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/23/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class MenuBarGradient: UIView {
    
    @IBInspectable var topColour: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1){
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColour: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1){
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColour.cgColor, bottomColour.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
}
}
