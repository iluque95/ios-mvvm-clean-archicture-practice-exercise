//
//  OperationsViewModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation
import SENetworking

class OperationsViewModel: BaseViewModel {
    
    override func baseURL() -> String {
        return "https://quiet-stone-2094.herokuapp.com"
    }
    
    func fetchData() {
        let endpoint = APIEndpoints.getRates(with: nil)
        dataTransferService().request(with: endpoint) { result in

            guard case let .success(response) = result, let rates = response as? [RateResponse] else { return }
            print("\(rates)")
        }
    }
}

fileprivate class APIEndpoints {
    
    static func getRates(with rateRequest: RateRequest?) -> Endpoint<[RateResponse]> {
            return Endpoint(path: "rates.json",
                            method: .get,
                            headerParamaters: ["Content-Type": "application/json"],
                            queryParametersEncodable: rateRequest)
    }
    
    static func getTransanctions(with transactionRequest: TransactionRequest?) -> Endpoint<TransactionResponse> {
            return Endpoint(path: "transactions.json",
                            method: .get,
                            headerParamaters: ["Content-Type": "application/json"],
                            queryParametersEncodable: transactionRequest)
    }
}
