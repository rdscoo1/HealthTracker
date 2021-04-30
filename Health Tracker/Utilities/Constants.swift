//
//  Constants.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 15.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import Foundation

class Constants {
    enum PressureLimits {
        static let maxHigh = 300
        static let maxLow = 200
        static let maxPulse = 300
        static let minValue = 40
    }
    
    enum AnalysisLimit {
        static let maxDefault: Int = 30
        static let minValue: Int = 0
    }
}
