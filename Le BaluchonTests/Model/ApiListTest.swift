//
//  ApiListTest.swift
//  Le BaluchonTests
//
//  Created by Anthony TUFFERY on 30/08/2021.
//

import XCTest
@testable import Le_Baluchon

class ApiListTest: XCTestCase {

    func testGetUrl() {
        let caseFixer = URLApiList.getUrl(.fixerApi)
        let caseGoogle = URLApiList.getUrl(.googleTranslateApi)
        let caseWeather = URLApiList.getUrl(.weatherApi)
        
        XCTAssertEqual("http://data.fixer.io/api/latest?access_key=3fd107b26fc4cf4ce56d8ca97071bcfa", caseFixer())
        XCTAssertEqual("https://translation.googleapis.com/language/translate/v2?key=AIzaSyAsnZVhVYQ8ozeGLI074UAJtzM053-zG-A", caseGoogle())
        XCTAssertEqual("https://api.openweathermap.org/data/2.5/weather?appid=77cba635bc7fa051f1f0952cfcaa4645", caseWeather())
    }

}
