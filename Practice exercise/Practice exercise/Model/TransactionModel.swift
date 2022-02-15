//
//  TransactionModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation

struct TransactionResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case sku
        case amount
        case currency
    }
    let sku: String
    let amount: String
    let currency: String
}
