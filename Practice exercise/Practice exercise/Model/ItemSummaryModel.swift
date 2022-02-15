//
//  ItemSummaryModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 14/2/22.
//

import Foundation

struct FromToCurrenciesPair {
    let from: CurrencyModel
    let to: CurrencyModel
}

class ItemSummaryModel {

    let transactions: [FromToCurrenciesPair]
    let amount: Float
    
    init(transactions: [FromToCurrenciesPair], amount: Float) {
        self.transactions = transactions
        self.amount = amount
    }
}
