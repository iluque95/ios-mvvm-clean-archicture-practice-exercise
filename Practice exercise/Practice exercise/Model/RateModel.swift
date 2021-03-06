//
//  RateModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation

struct RateResponse: Decodable {
    init(from: String, to: String, rate: String) {
        self.from = from
        self.to = to
        self.rate = rate
    }
    private enum CodingKeys: String, CodingKey {
        case from
        case to
        case rate
    }
    let from: String
    let to: String
    let rate: String
}

