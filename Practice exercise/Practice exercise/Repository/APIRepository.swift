//
//  APIRepository.swift
//  Practice exercise
//
//  Created by Itiel Luque on 15/2/22.
//

import Foundation
import SENetworking

final class APIRepository {
    static let shared: APIRepository = APIRepository()
    
    private init() {}
    
    func getRates() -> Endpoint<[RateResponse]?> {
            return Endpoint(path: "rates",
                            method: .get,
                            headerParamaters: ["Content-Type": "application/json",
                                               "Accept": "application/json"],
                            queryParametersEncodable: nil)
    }
    
    func getTransanctions() -> Endpoint<[TransactionResponse]?> {
            return Endpoint(path: "transactions",
                            method: .get,
                            headerParamaters: ["Content-Type": "application/json",
                                               "Accept": "application/json"],
                            queryParametersEncodable: nil)
    }
}
