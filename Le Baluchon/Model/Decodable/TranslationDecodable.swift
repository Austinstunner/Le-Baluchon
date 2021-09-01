//
//  TranslationDecodable.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 26/08/2021.
//

import Foundation

struct Translation: Codable {
    let data: MyData
}

struct MyData: Codable {
    let translations: [MyTranslation]
}

struct MyTranslation: Codable {
    let translatedText: String
}
