//
//  CurrencyConversor.swift
//  Practice exercise
//
//  Created by Itiel Luque on 14/2/22.
//

import Foundation

final class CurrencyConversor {
    static func convert(from: CurrencyModel, to: String, rates: [String:[RateResponse]]) -> CurrencyModel {
        
        if from.currency != to {
        
            if let currencies = rates[from.currency] {
                for currency in currencies {
                    if currency.to == to {
                        return CurrencyModel(currency: to, amount: multiply(a:  (Float(currency.rate) ?? 1.0), b: from.amount))
                    }
                }
                
                for currency in currencies {
                    return convert(from: CurrencyModel(currency: currency.to, amount: multiply(a: (Float(currency.rate) ?? 1.0), b: from.amount)), to: to, rates: rates)
                }
            }
        }
        
        return from
    }
    
    /// Multiply a per b and round to two decimals.
    public static func multiply(a: Float, b: Float) -> Float {
        return roundValue(a*b)
    }
    
    /// Sum a plus b and round to two decimals.
    public static func sum(a: Float, b: Float) -> Float {
        return roundValue(a+b)
    }
    
    /// Rounds to two decimals
    private static func roundValue(_ value: Float) -> Float {
        return round(value * 100) / 100.0
    }
}
