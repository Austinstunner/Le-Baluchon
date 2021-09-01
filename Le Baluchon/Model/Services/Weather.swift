//
//  Weather.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 14/08/2021.
//

import Foundation

class WeatherManager {
    private var session: URLSession
    private var taskSession: URLSessionDataTask?
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    func initWeatherOfNY(chooseCity: Int, units: String) -> URLRequest? {
        let id = "&id=\(chooseCity)"

        let unit = "&units=\(units)"
        let format = "&format=json"
        let lang = "&lang=fr"
        
        guard let translationUrl = URL(string: URLApiList.getUrl(.weatherApi)() + id + unit + format + lang) else { return nil}
        
        var request = URLRequest(url: translationUrl)
        
        request.httpMethod = "POST"
        return request
    }

    func getWeatherOfNY(chooseCity: Int, units: String, callBack: @escaping (Error?, Weather?) -> Void) {
        guard let url = initWeatherOfNY(chooseCity: chooseCity, units: units) else { return }
        
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
    
    
    

