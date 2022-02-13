//
//  CurrencyModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation

struct CurrencyModel: Decodable {
    var from: String
    var to: String
    var rate: Float
}

