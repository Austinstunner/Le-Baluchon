//
//  SecondWeather.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 30/08/2021.
//

import Foundation

class SecondWeatherManager {
    
    private var session: URLSession
    private var taskSession: URLSessionDataTask?
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
        func initWeather(chooseCity: String, units: String) -> URLRequest? {
            let q = "&q=\(chooseCity)"
            let unit = "&units=\(units)"
            let format = "&format=json"
            
            guard let translationUrl = URL(string: URLApiList.getUrl(.weatherApi)() + q + unit + format) else { return nil}
            
            var request = URLRequest(url: translationUrl)
            
            request.httpMethod = "POST"
            return request
        }
    func getWeather(chooseCity: String, units: String, name: String, callBack: @escaping (Error?, Weather?) -> Void) {
    guard let url = initWeather(chooseCity: chooseCity, units: units) else { return }
    
    taskSession?.cancel()
    
    taskSession = session.dataTask(with: url) {data,response,error in
        
        DispatchQueue.main.async {
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callBack(error,nil)
                return
            }
            do {
                let responseJSON = try JSONDecoder().decode(Weather.self, from: data)
                callBack(nil, responseJSON)
            } catch {
                callBack(error, nil)
            }
        }
    }
    taskSession?.resume()
}
    
}
