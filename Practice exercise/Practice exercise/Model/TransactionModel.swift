//
//  TransactionModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation

struct TransactionModel: Decodable {
    var sku: String
    var amount: Float
    var currency: String
}
