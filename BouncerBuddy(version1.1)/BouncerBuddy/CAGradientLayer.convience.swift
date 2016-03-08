//
//  CAGradientLayer+convience.swift
//  BouncerBuddy
//
//  Created by Jiaxi Liu on 3/8/16.
//  Copyright © 2016 Sheryl Hong. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func turquoiseColor() -> CAGradientLayer {
        
        
        let topColor = UIColor(red: (239/255.0), green: (239/255.0), blue: (187/255.0), alpha: 1)
        let bottomColor = UIColor(red: (212/255.0), green: (211/255.0), blue: (221/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
        
    }

}
