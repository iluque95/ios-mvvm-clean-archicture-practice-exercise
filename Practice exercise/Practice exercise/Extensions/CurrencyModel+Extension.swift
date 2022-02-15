//
//  CurrencyModel Extension.swift
//  Practice exercise
//
//  Created by Itiel Luque on 15/2/22.
//

import Foundation

extension CurrencyModel {
    func convert(to: String, rates: [String:[RateResponse]]) -> CurrencyModel {
        
        if self.currency != to {
        
            if let currencies = rates[self.currency] {
                for currency in currencies {
                    if currency.to == to {
                        var amount = Float(currency.rate) ?? 1.0
                        amount.roundedMultiply(with: self.amount)
                        return CurrencyModel(currency: to, amount: amount)
                    }
                }
                
                for currency in currencies {
                    var amount = Float(currency.rate) ?? 1.0
                    amount.roundedMultiply(with: self.amount)
                    return CurrencyModel(currency: currency.to, amount: amount).convert(to: to, rates: rates)
                }
            }
        }
        
        return self
    }
}

