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
        
        
        let topColor = UIColor(red: (150/255.0), green: (222/255.0), blue: (218/255.0), alpha: 1)
        let bottomColor = UIColor(red: (80/255.0), green: (201/255.0), blue: (195/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
        
    }

}
