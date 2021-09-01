//
//  ApiList.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 26/08/2021.
//

import Foundation
import UIKit

//Define enumeration for each used API
enum URLApiList {
    case fixerApi, googleTranslateApi, weatherApi
    
    func getUrl() -> String {
        var urlString = ""
        switch self {
        case .fixerApi:
            urlString = "http://data.fixer.io/api/latest?" + "\(keyForFixer.fixerToken)"
        case .googleTranslateApi:
            urlString = "https://translation.googleapis.com/language/translate/v2?" + "\(keyForGoogle.fixerToken)"
        case .weatherApi:
            urlString = "https://api.openweathermap.org/data/2.5/weather?" + "\(keyForWeather.fixerToken)"
        }
        return urlString
    }
    
}

// define the structure of the API's Key
struct keyForFixer {
    static let baseFixerAccess: String = "access_key="
    static let keyFixer: String = "3fd107b26fc4cf4ce56d8ca97071bcfa"
    static let fixerToken: String = baseFixerAccess + keyFixer
}

struct keyForGoogle {
    static let baseFixerAccess: String = "key="
    static let keyFixer: String = "AIzaSyAsnZVhVYQ8ozeGLI074UAJtzM053-zG-A"
    static let fixerToken: String = baseFixerAccess + keyFixer
}

struct keyForWeather {
    static let baseFixerAccess: String = "appid="
    static let keyFixer: String = "77cba635bc7fa051f1f0952cfcaa4645"
    static let fixerToken: String = baseFixerAccess + keyFixer
}





