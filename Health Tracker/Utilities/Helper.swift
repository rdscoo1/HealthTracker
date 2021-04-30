//
//  Helpers.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 15.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

class Helper {
    
    static let instance = Helper()
    
    private init(){}
    
    func checkTextField(text: String, minValue: Int, maxValue: Int) -> Bool {
        guard
            !text.isEmpty,
            let value = Int(text),
            minValue <= value,
            value <= maxValue
        else {
            return false
        }
        return true
    }
    
}

let screen = UIScreen.main.bounds
