//
//  TranslationDecodableTest.swift
//  Le BaluchonTests
//
//  Created by Anthony TUFFERY on 30/08/2021.
//

import XCTest
@testable import Le_Baluchon

class TranslationDecodableTest: XCTestCase {
    
    func testInitTranslation() {
        let translation = Translation(data: MyData(translations: [MyTranslation(translatedText: "bonjour")]))
        
        XCTAssertEqual("bonjour", translation.data.translations[0].translatedText)
        
    }
    
    
    
    
    
    
    
}

