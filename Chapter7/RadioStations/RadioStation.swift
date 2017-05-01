//
//  RadioStation.swift
//  RadioStations
//
//  Created by Derek Lu on 01/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

class RadioStation: NSObject {
    var name: String
    var frequency: Double
    
    override init(){
        name = "Default"
        frequency = 100
    }
    
    class func minAMFrequency() -> Double {
        return 520.0
    }
    
    class func maxAMFrequency() -> Double {
        return 1610.0
    }
    
    class func minFMFrequency() -> Double {
        return 88.3
    }
    
    class func maxFMFrequency() -> Double {
        return 107.9
    }
    
    func band() -> Int {
        let condition = frequency >= RadioStation.minFMFrequency() && frequency <= RadioStation.maxFMFrequency()
        if condition {
            return 1 // FM
        } else {
            return 0 // AM
        }
    }

}
