//
//  RateModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation

struct RateRequest: Encodable {
}

struct RateResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
        case rate = "rate"
    }
    let from: String
    let to: String
    let rate: String
}

