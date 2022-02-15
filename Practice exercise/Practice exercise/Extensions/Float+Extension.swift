//
//  Float+Extension.swift
//  Practice exercise
//
//  Created by Itiel Luque on 15/2/22.
//

import Foundation

extension Float {
    /// Multiply a per b and round to two decimals.
    mutating func roundedMultiply(with value: Float) {
        self = self*value
        self.roundValue()
    }
    
    /// Sum a plus b and round to two decimals.
    mutating func roundedSum(with value: Float) {
        self = self+value
        self.roundValue()
    }
    
    /// Rounds to two decimals
    private mutating func roundValue() {
        self = Darwin.round(self * 100) / 100.0
    }

}
