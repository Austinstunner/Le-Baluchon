//
//  WeatherDecodableTest.swift
//  Le BaluchonTests
//
//  Created by Anthony TUFFERY on 30/08/2021.
//

import XCTest
@testable import Le_Baluchon

class WeatherDecodableTest: XCTestCase {

    func testInitWeather() {
        let weather = Weather(weather: [MyWeather(description: "pluie", icon: "2cd")], main: MyMain(temp: 20.0))
        
        XCTAssertEqual("pluie", weather.weather[0].description)
        XCTAssertEqual("2cd", weather.weather[0].icon)
        XCTAssertEqual(20.0, weather.main.temp)
        
    }

}
