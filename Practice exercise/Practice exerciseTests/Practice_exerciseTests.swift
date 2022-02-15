//
//  Practice_exerciseTests.swift
//  Practice exerciseTests
//
//  Created by Itiel Luque on 13/2/22.
//

import XCTest
@testable import Practice_exercise

class Practice_exerciseTests: XCTestCase {
    
    let rates: [String: [RateResponse]] = ["EUR": [RateResponse(from: "EUR", to: "USD", rate: "1.359"),
                                                     RateResponse(from: "EUR", to: "CAD", rate: "1.366")],
                                           "CAD": [RateResponse(from: "CAD", to: "EUR", rate: "0.732")],
                                           "USD": [RateResponse(from: "USD", to: "EUR", rate: "0.736")]]

    
    func testCurrencyConversorTest1() throws {
        let from = CurrencyModel(currency: "EUR", amount: 10)
        let to = "USD"
        let res = from.convert(to: to, rates: rates)
        
        XCTAssertEqual(res.amount, 13.59)
        XCTAssertEqual(res.currency, to)
    }
    
    func testCurrencyConversorTest2() throws {
        let from = CurrencyModel(currency: "USD", amount: 10)
        let to = "CAD"
        let res = from.convert(to: to, rates: rates)
        
        XCTAssertEqual(res.amount, 10.05)
        XCTAssertEqual(res.currency, to)
    }
    
    func testCurrencyConversorTest3() throws {
        let from = CurrencyModel(currency: "CAD", amount: 10.05)
        let to = "USD"
        let res = from.convert(to: to, rates: rates)
        
        XCTAssertEqual(res.amount, 10.00)
        XCTAssertEqual(res.currency, to)
    }

}
