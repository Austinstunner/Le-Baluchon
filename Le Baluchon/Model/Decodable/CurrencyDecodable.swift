//
//  CurrencyDecodable.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 28/08/2021.
//

import Foundation

struct Currency: Decodable {
    let base: String
    let date: String
    let rates: [String: Double]
}
