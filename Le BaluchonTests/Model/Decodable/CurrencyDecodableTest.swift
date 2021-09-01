//
//  CurrencyDecodableTest.swift
//  Le BaluchonTests
//
//  Created by Anthony TUFFERY on 30/08/2021.
//

import XCTest
@testable import Le_Baluchon

class CurrencyDecodableTest: XCTestCase {

    func testInitCurrency() {
        let currency = Currency(base: "EUR", date: "Janvier", rates: ["EUR" : 1.0])
        
                XCTAssertEqual("EUR", currency.base)
               XCTAssertEqual("Janvier", currency.date)
               XCTAssertEqual(["EUR" : 1.0], currency.rates)
    }
}
