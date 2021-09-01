//
//  WeatherDecodable.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 23/08/2021.
//

import Foundation

struct Weather: Codable {
    let weather: [MyWeather]
    let main: MyMain
}

struct MyWeather: Codable {
    let description: String
    let icon: String
}

struct MyMain: Codable {
    let temp: Double
}

