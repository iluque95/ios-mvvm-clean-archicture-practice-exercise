//
//  TransactionModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation


struct TransactionRequest: Encodable {
}

struct TransactionResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case sku = "sku"
        case amount = "amount"
        case currency = "currency"
    }
    let sku: String
    let amount: Float
    let currency: String
}
