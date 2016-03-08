//
//  BannedModel.swift
//  BouncerBuddy
//
//  Created by Sha Wu on 16/3/7.
//  Copyright © 2016年 Sheryl Hong. All rights reserved.
//

import Foundation

class BannedModel:NSObject {
    
        
        //properties
        
        var name: String?
        var gender: String?
        var notes: String?
    
        
        //empty constructor
        
        override init()
        {
            
        }
        
        //construct with @name, @address, @latitude, and @longitude parameters
        
        init(name: String, gender: String, notes: String) {
            
            self.name = name
            self.gender = gender
            self.notes = notes
            
        }
        
        
        //prints object's current state
        
        override var description: String {
            return "Name: \(name), Gender: \(gender), Notes: \(notes)"
            
        }
        
        
    
}