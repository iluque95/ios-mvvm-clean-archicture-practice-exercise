//
//  TransactionsViewModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation
import SENetworking

class TransactionsViewModel: BaseViewModel {
    var delegate: MainViewControllerOutput?
    var transactions: [String: [TransactionResponse]] = [:]
    var rates: [String:[RateResponse]] = [:]
    
    override init() {
        super.init()
    }
    
    override func baseURL() -> String {
        return "https://quiet-stone-2094.herokuapp.com"
    }
    
    func fetchRates(completion: @escaping ([RateResponse]?)->Void) {
        let endpoint = apiRepository.getRates()
        dataTransferService().request(with: endpoint) { result in
            guard case let .success(response) = result, let res = response else { return }
            completion(res)
        }
    }
    
    func fetchTransactions(completion: @escaping ([TransactionResponse]?)->Void) {
        let endpoint = apiRepository.getTransanctions()
        apiDataTransferService.request(with: endpoint) { result in
            guard case let .success(response) = result, let res = response else { return }
            completion(res)
        }
    }
}

// MARK: MainViewControllerInput
extension TransactionsViewModel: MainViewControllerInput {
    
    func requestData(for selected: String) {
        if let skuTransactions = transactions[selected] {
            var amount: Float = 0.0
            var currencyPairsTransactions: [FromToCurrenciesPair] = []
            for transaction in skuTransactions {
                let from = CurrencyModel(currency: transaction.currency, amount: Float(transaction.amount) ?? 0.0)
                let converted = from.convert(to: "EUR", rates: rates)
                let to = CurrencyModel(currency: "EUR", amount: converted.amount)
                
                currencyPairsTransactions.append(FromToCurrenciesPair(from: from, to: to))
                
                amount.roundedSum(with: converted.amount)
            }
            let summary = ItemSummaryModel(transactions: currencyPairsTransactions, amount: amount)
            delegate?.requestedData(summary: summary)
        }
    }
    
    func fetchData() {
        fetchTransactions() { data in
            if let data = data {
                for transaction in data {
                    if self.transactions[transaction.sku] == nil {
                        self.transactions[transaction.sku] = []
                    }
                    self.transactions[transaction.sku]?.append(transaction)
                }
                self.delegate?.getData(data: [String](self.transactions.keys))
            }
        }
        
        fetchRates() { data in
            if let data = data {
                for rate in data {
                    if self.rates[rate.from] == nil {
                        self.rates[rate.from] = []
                    }
                    self.rates[rate.from]?.append(rate)
                }
            }
        }
    }
}
